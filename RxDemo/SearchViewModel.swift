//
//  SearchViewModel.swift
//  RxDemo
//
//  Created by Sylvain Rebaud on 11/30/18.
//  Copyright © 2018 Plutinosoft. All rights reserved.
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
    let image: Driver<UIImage?>

    init?(url: URL?, imageLoader: ImageLoading) {
        guard let url = url else { return nil }

        self.image = imageLoader.fetch(at: url)
            .asDriver(onErrorJustReturn: nil)
    }

    init?(model: APISearchResultModel, imageLoader: ImageLoading) {
        guard let url = model.images["fixed_height"]?.url else { return nil }

        self.init(url: url, imageLoader: imageLoader)
    }
}

struct SearchViewModel {
    // inputs
    let query = PublishSubject<String>()

    // outputs
    lazy var results: Observable<[SearchResultModel]> = self.fetchResults()

    // private
    let imageLoader = ImageLoader(maxConcurrentDownloadCount: 3)
    let scheduler = ConcurrentDispatchQueueScheduler(qos: .background)

    func fetchResults() -> Observable<[SearchResultModel]> {
        return query
            // performs API call and parsing on background thread
            .observeOn(scheduler)
            .flatMapLatest { [imageLoader] query -> Observable<[SearchResultModel]> in
                guard query.count > 0 else { return .just([]) }
                
                let url = URL(string: "https://api.giphy.com/v1/gifs/search?api_key=1GvPrRNGoJwT4EAzvAjXVqriydG3YFm1&q=\(query)")!
                let request = URLRequest(url: url)
                
                return imageLoader.flush()
                    .andThen(URLSession.shared.rx.data(request: request))
                    .map { try JSONDecoder().decode(APISearchResultsModel.self, from: $0) }
                    .map { [imageLoader] results in
                        results.data.compactMap { SearchResultModel(model: $0, imageLoader: imageLoader) }
                    }
            }
            .catchErrorJustReturn([])
            .observeOn(MainScheduler.instance)
    }
}
