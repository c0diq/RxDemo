//
//  ImageLoader.swift
//  RxDemo
//
//  Created by Sylvain Rebaud on 12/4/18.
//  Copyright © 2018 Plutinosoft. All rights reserved.
//

import RxCocoa
import RxSwift
import SwiftGif
import UIKit

protocol ImageLoading {
    func fetch(at url: URL) -> Single<UIImage?>
}

final class ImageLoader: ImageLoading {
    private var cache = NSCache<NSString, UIImage>()
    private var scheduler = ConcurrentDispatchQueueScheduler(qos: .background)

    init(maxBytesSize: Int) {
        cache.totalCostLimit = maxBytesSize
    }

    func fetch(at url: URL) -> Single<UIImage?> {
        return Single.deferred { [weak self] () in
            guard let `self` = self else { return .just(nil) }

            if let image = self.cache.object(forKey: url.absoluteString as NSString) {
                return Single.just(image)
            }

            return Observable.just(url)
                .flatMap { URLSession.shared.rx.data(request: URLRequest(url: $0)) }
                .map { (data: $0, image: UIImage.gif(data: $0)) }
                .do(onNext: { [weak self] data, image in
                    if image != nil {
                        self?.cache.setObject(image!, forKey: url.absoluteString as NSString, cost: data.count)
                    }
                })
                .map { $0.image }
                .catchErrorJustReturn(nil)
                .asSingle()
        }
        .subscribeOn(self.scheduler)
    }
}
