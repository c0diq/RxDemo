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
            .flatMap { URLSession.shared.rx.data(request: URLRequest(url: $0)) }
            .map { UIImage.gif(data: $0) }
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
            // performs API call and parsing on background thread
            .observeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .flatMapLatest { query -> Observable<[SearchResultModel]> in
                let url = URL(string: "https://api.giphy.com/v1/gifs/search?api_key=1GvPrRNGoJwT4EAzvAjXVqriydG3YFm1&q=\(query)")!
                let request = URLRequest(url: url)
                
                return URLSession.shared.rx.data(request: request)
                    .map { try JSONDecoder().decode(APISearchResultsModel.self, from: $0) }
                    .map { $0.data.compactMap(SearchResultModel.init) }
                    // immediately send empty result to indicate new fetch is starting
                    .startWith([])
            }
            .catchErrorJustReturn([])
            // forwards events on main thread
            .observeOn(MainScheduler.instance)
    }
}
