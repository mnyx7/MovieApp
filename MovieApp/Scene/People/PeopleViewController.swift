//
//  PeopleViewController.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 22.04.23.
//

import UIKit

class PeopleViewController: UIViewController {
    @IBOutlet private weak var collection: UICollectionView!
    
    private let viewModel = PeopleViewModel()
    private let cellId = "\(TopImageButtomLabelCell.self )"
    
    var coordinator: PeopleCoordinator?
    
    let refreshController = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureViewModel()
        
        coordinator = PeopleCoordinator(navigationController: navigationController ?? UINavigationController())
    }
    
    func configureUI() {
        refreshController.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        collection.refreshControl = refreshController
        collection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    func configureViewModel() {
        refreshController.beginRefreshing()
        viewModel.getPopularPeople()
        viewModel.successCallBack = {
            self.collection.reloadData()
            self.refreshController.endRefreshing()
        }
        viewModel.errorCallBack = { message in
            print("people error: \(message)")
            self.refreshController.endRefreshing()
        }
    }
    
    @objc func pullToRefresh() {
        viewModel.reset()
        collection.reloadData()
        viewModel.getPopularPeople()
    }
}

extension PeopleViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TopImageButtomLabelCell
        cell.configure(data: viewModel.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2 - 10, height: 220)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        coordinator?.showPeopleMoviesController(id: viewModel.items[indexPath.item].id ?? 0)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.pagination(index: indexPath.item)
    }
    
}
