//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 10.04.23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
//    private var movieItems = [Result]()
//    
//    func configure(data: [Result]) {
//        movieItems = data
//        collectionView.reloadData()
//    }
    
//    var movies = [MovieApp]()
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViewModel()
        configCollection()
    }
    
    func configViewModel() {
//        var items: [HomeCategory] = [ .popular, .topRated ]
//        for item in items {
//            viewModel.getMovieItems(category: item)
//        }
//
//        viewModel.getPopularMovies()
//        viewModel.getTopRatedMovies()
        
        viewModel.getItems()
        
        viewModel.successCallBack = {
            self.collectionView.reloadData()
        }
        viewModel.errorCallBack = { message in
            //error message or alert
        }
    }
    func configCollection() {
        
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
