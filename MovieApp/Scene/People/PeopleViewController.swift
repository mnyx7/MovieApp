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
    
    let refreshController = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureViewModel()
    }
    
    func configureUI() {
        refreshController.addTarget(self, action: #selector(pullToRefresh ), for: .valueChanged)
        collection.refreshControl = refreshController
        collection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    func configureViewModel() {
        
        refreshController.beginRefreshing()
        viewModel.getPopularPeople()
        viewModel.successCallBack = {
            self.collection.reloadData()
        }
        viewModel.errorCallBack = { message in
            print("people error: \(message)")
        }
//        refreshController.beginRefreshing()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.viewModel.getPopularPeople()
//        }
//        viewModel.successCallback = {
//            self.refreshController.endRefreshing()
//            self.collection.reloadData()
//        }
    }
    
    @objc func pullToRefresh() {
        viewModel.reset()
        collection.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.viewModel.getPopularPeople()
        }
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
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ActorMoviesController") as! ActorMoviesController
        vc.viewModel.id = viewModel.items[indexPath.item].id
        navigationController?.show(vc, sender: nil)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.pagination(index: indexPath.item)
    }
    
}
