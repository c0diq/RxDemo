//
//  ImageLoader.swift
//  RxDemo
//
//  Created by Sylvain Rebaud on 12/4/18.
//  Copyright © 2018 Fitbit. All rights reserved.
//

import RxCocoa
import RxSwift
import SwiftGif
import UIKit

protocol ImageLoading {
    func fetch(at url: URL) -> Single<UIImage?>
    func flush() -> Completable
}

class ImageLoader: ImageLoading {
    var cache = [URL: Data]()
    var scheduler: OperationQueueScheduler

    init(maxConcurrentDownloadCount: Int) {
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = maxConcurrentDownloadCount
        scheduler = OperationQueueScheduler(operationQueue: operationQueue, queuePriority: .normal)
    }

    func fetch(at url: URL) -> Single<UIImage?> {
        return Single.deferred { [weak self] () in
            guard let `self` = self else { return .just(nil) }

            if let data = self.cache[url] {
                return Single.just(data)
                    .map { UIImage.gif(data: $0) }
            }

            return Observable.just(url)
                .flatMap { URLSession.shared.rx.data(request: URLRequest(url: $0)) }
                .do(onNext: { [weak self] data in
                    self?.cache[url] = data
                })
                .map { UIImage.gif(data: $0) }
                .catchErrorJustReturn(nil)
                .asSingle()
        }
        .subscribeOn(self.scheduler)
    }

    func flush() -> Completable {
        return Completable.deferred { [weak self] in
            self?.cache = [URL: Data]()
            return .empty()
        }
    }
}
