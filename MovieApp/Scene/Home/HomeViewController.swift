//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 10.04.23.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    var movies = [MovieApp]()
    var viewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViewModel()
        configCollection()
        
        
        collectionView.register(UINib(nibName: "XibCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "XibCollectionViewCell")
        
        viewModel.getPopularMovies()
        //        movieModel.completion = {
        //            self.collectionView.reloadData()
        //        }
    }
    
    func configViewModel() {
        viewModel.getPopularMovies()
        viewModel.successCallBack = {
            //reload collection
        }
    }
    func configCollection(){
        
    }
    
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3//burda category vertical scrolldaki itemlerin countu olacaq movieModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "XibCollectionViewCell", for: indexPath) as! XibCollectionViewCell
        //   cell.movieName = movieModel.movies[indexPath.row].
        return cell
    }
    
    
}
