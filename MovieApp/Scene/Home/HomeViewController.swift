//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 10.04.23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var search: UIBarButtonItem!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var viewModel = HomeViewModel()
    
    var movieList = [MovieApp]()
    var movieListOriginal = [MovieApp]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViewModel()
        //configUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        configUI()
    }
    
    func configViewModel() {
        
        viewModel.getItems()
        
        viewModel.successCallBack = {
            self.collectionView.reloadData()
        }
        viewModel.errorCallBack = { message in
            //error message or alert
        }
    }
    func configUI() {
        navigationItem.title = "home_title".localize
        collectionView.reloadData()
        //NSLocalizedString("home_title", comment: "")
    }
    
    
    @IBAction func searchTapped(_ sender: Any) {
        //navigation.show(
    }
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        //        cell.movieItems = viewModel.categoryItems
        cell.configure(data: viewModel.items[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 318)
    }
    
}
