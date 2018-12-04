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
        searchController.searchBar.placeholder = "Search Giphy"
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
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.topViewController?.definesPresentationContext = true

        searchController.searchBar.autocorrectionType = .no
        searchController.searchBar.autocapitalizationType = .none
    }

    private func setupRx() {
        let query = searchController.searchBar.rx.text
            .orEmpty
            .filter { $0.count > 1 }
            .debounce(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()

        query
            .bind(to: viewModel.query)
            .disposed(by: disposeBag)

        viewModel
            .fetchResults()
            .asObservable()
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
    }

    func bind(_ model: SearchResultModel) {
        model.image
            .drive(imageView!.rx.image)
            .disposed(by: disposeBag)
    }
}
