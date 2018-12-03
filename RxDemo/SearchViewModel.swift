//
//  SearchViewModel.swift
//  RxDemo
//
//  Created by Sylvain Rebaud on 11/30/18.
//  Copyright © 2018 Fitbit. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit
import SwiftGif

struct APISearchResultModel: Decodable {
    struct APISearchResultImage: Decodable {
        let url: URL?
    }

    let type: String
    let url: URL
    let title: String

    let images: [String: APISearchResultImage]
}

struct APISearchResultsModel: Decodable {
    let data: [APISearchResultModel]
}

struct SearchResultModel {
    let image: Observable<UIImage?>

    init?(url: URL?) {
        guard let url = url else { return nil }

        self.image = Observable.just(url)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .flatMap {
                URLSession.shared.rx.data(request: URLRequest(url: $0))
            }
            .map {
                UIImage.gif(data: $0)
        }
    }

    init?(model: APISearchResultModel) {
        guard let url = model.images["fixed_height"]?.url else { return nil }

        self.init(url: url)
    }
}

struct SearchViewModel {
    // inputs
    let query = PublishSubject<String>()

    // outputs
    lazy var results: Observable<[SearchResultModel]> = self.fetchResults()

    func fetchResults() -> Observable<[SearchResultModel]> {
        return query
            .observeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .flatMapLatest { query -> Observable<[SearchResultModel]> in
                let url = URL(string: "https://api.giphy.com/v1/gifs/search?api_key=1GvPrRNGoJwT4EAzvAjXVqriydG3YFm1&q=\(query)")!
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
                    .map {
                        try JSONDecoder().decode(APISearchResultsModel.self, from: $0)
                    }
                    .map {
                        $0.data.compactMap(SearchResultModel.init)
                    }
                    // immediately send empty result to indicate new fetch is starting
                    .startWith([])
            }
            .observeOn(MainScheduler.instance)
            .catchErrorJustReturn([])
    }

    func fetchResultsKeynote() -> Observable<[SearchResultModel]> {
        return query
            // do work on background thread
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .map { query -> Observable<Any> in
                let url = URL(string: "https://api.giphy.com/v1/gifs/search?api_key=1GvPrRNGoJwT4EAzvAjXVqriydG3YFm1&q=\(query)")!
                return URLSession.shared.rx.json(url: url)
                    .retry(3)
                    .catchError { _ in Observable.empty() }
            }
            .switchLatest()
            .map { json -> [URL?] in
                self.parseRemoteModels(json: json)
            }
            .map { urls -> [SearchResultModel] in
                urls.compactMap(SearchResultModel.init)
            }
            // observe results on main thread
            .observeOn(MainScheduler.instance)
            .catchErrorJustReturn([])
    }

    func parseRemoteModels(json: Any) -> [URL?] {
        guard
            let json = json as? [String: Any],
            let results = json["data"] as? [Any]
            else { return [] }

        return results.compactMap {
            guard
                let result = $0 as? [String: Any],
                let images = result["images"] as? [String: Any],
                let image = images["fixed_height"] as? [String: Any]
                else { return nil }

            return URL(string: image["url"] as? String ?? "")
        }
    }

    enum RxDemoError : Swift.Error {
        /// Unknown error occurred.
        case unknown
        /// Response is not NSHTTPURLResponse
        case nonHTTPResponse(response: URLResponse)
        /// Response is not successful. (not in `200 ..< 300` range)
        case httpRequestFailed(response: HTTPURLResponse, data: Data?)
        /// Deserialization error.
        case deserializationError(error: Swift.Error)
    }

    public func response(request: URLRequest) -> Observable<(response: HTTPURLResponse, data: Data)> {
        return Observable.create { observer in
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let response = response, let data = data else {
                    observer.on(.error(error ?? RxDemoError.unknown))
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse else {
                    observer.on(.error(RxDemoError.nonHTTPResponse(response: response)))
                    return
                }

                observer.on(.next((httpResponse, data)))
                observer.on(.completed)
            }

            task.resume()

            return Disposables.create() {
                task.cancel()
            }
        }
    }

    public func data(url: URL) -> Observable<Data> {
        return response(request: URLRequest(url: url)).map { pair -> Data in
            guard 200 ..< 300 ~= pair.0.statusCode else {
                throw RxCocoaURLError.httpRequestFailed(response: pair.0, data: pair.1)
            }

            return pair.1
        }
    }

    public func json(url: URL) -> Observable<Any> {
        return data(url: url).map { data -> Any in
            do {
                return try JSONSerialization.jsonObject(with: data, options: [])
            } catch let error {
                throw RxCocoaURLError.deserializationError(error: error)
            }
        }
    }
}
