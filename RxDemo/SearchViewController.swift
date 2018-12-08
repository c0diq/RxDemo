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
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.autocorrectionType = .no
        searchController.searchBar.autocapitalizationType = .none
        searchController.obscuresBackgroundDuringPresentation = false
        return searchController
    }()

    private var disposeBag = DisposeBag()
    private var viewModel = SearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupProperties()
        setupRx()
    }

    private func setupProperties() {
        collectionView.dataSource = nil
        collectionView.delegate = nil

        let flowLayout = UICollectionViewFlowLayout()
        let size = (collectionView.frame.size.width - CGFloat(30)) / CGFloat(1)
        flowLayout.itemSize = CGSize(width: size, height: size)
        collectionView.setCollectionViewLayout(flowLayout, animated: false)

        navigationItem.searchController = searchController
        navigationItem.title = "Giphy"
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = false
        definesPresentationContext = true
    }

    private func setupRx() {
        let query = searchController.searchBar.rx.text
            .orEmpty
            .filter { $0.count > 1 }
            .debounce(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()

        searchController.searchBar.rx.searchButtonClicked
            .do(onNext: { [searchController] _ in
                searchController.isActive = false
            })
            .subscribe()
            .disposed(by: disposeBag)

        query
            .bind(to: viewModel.query)
            .disposed(by: disposeBag)

        viewModel
            .fetchResults()
            .asObservable()
            .do(onNext: { [collectionView] _ in
                // scroll back to the top
                collectionView?.contentOffset = CGPoint(x: 0, y: 0)
            })
            .bind(to: collectionView.rx.items(cellIdentifier: "cell", cellType: Cell.self)) { row, model, cell in
                cell.bind(model)
            }
            .disposed(by: disposeBag)
    }
}

class Cell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!

    private(set) var disposeBag = DisposeBag()

    override func prepareForReuse() {
        disposeBag = DisposeBag()

        imageView.image = nil
    }

    func bind(_ model: SearchResultModel) {
        model.image
            .drive(imageView!.rx.image)
            .disposed(by: disposeBag)
    }
}
