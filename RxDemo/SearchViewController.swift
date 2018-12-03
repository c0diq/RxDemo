//
//  SearchViewController.swift
//  RxDemo
//
//  Created by Sylvain Rebaud on 11/23/18.
//  Copyright © 2018 Fitbit. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftGif

class SearchViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search for gifs"
        return searchController
    }()

    private var disposeBag = DisposeBag()
    private var viewModel = SearchViewModel()
    private var gifs = [SearchResultModel]()

    var searchBar: UISearchBar {
        return searchController.searchBar
    }

    private var latestQuery: Observable<String> {
        return searchController.searchBar
            .rx.text
            .orEmpty
            .filter { $0.count > 1 }
            .debounce(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupProperties()
        setupRx()
    }

    private func setupProperties() {
        collectionView.dataSource = nil
        let flowLayout = UICollectionViewFlowLayout()
        let size = (collectionView.frame.size.width - CGFloat(30)) / CGFloat(3)
        flowLayout.itemSize = CGSize(width: size, height: size)
        collectionView.setCollectionViewLayout(flowLayout, animated: true)

        navigationItem.searchController = searchController
        navigationItem.title = "Giphy"
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.topViewController?.definesPresentationContext = true

        searchController.searchBar.autocorrectionType = .no
        searchController.searchBar.autocapitalizationType = .none
    }

    private func parseJSONResults(_ data: Data) -> Any {
        return data as Any
    }

    private func parseRemoteModels(_ json: Any) -> [URL?] {
        return json as! [URL?]
    }

    private func setupRx() {
        latestQuery
            .bind(to: viewModel.query)
            .disposed(by: disposeBag)

        viewModel
            .fetchResults()
            .bind(to: collectionView.rx.items(cellIdentifier: "cell", cellType: Cell.self)) { row, model, cell in
                cell.bind(model)
            }
            .disposed(by: disposeBag)

//        // log results
//        latestQuery
//            .subscribe(onNext: {
//                NSLog("\($0)")
//            })
//            .disposed(by: disposeBag)
//
//        viewModel
//            .fetchResults()
//            .subscribe(onNext: {
//                NSLog("\($0)")
//            })
//            .disposed(by: disposeBag)
    }
}

class Cell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    let disposeBag = DisposeBag()

    func bind(_ model: SearchResultModel) {
        model.image
            .takeUntil(rx.methodInvoked(#selector(prepareForReuse)))
            .asDriver(onErrorJustReturn: nil)
            .drive(imageView!.rx.image)
            .disposed(by: disposeBag)
    }
}
