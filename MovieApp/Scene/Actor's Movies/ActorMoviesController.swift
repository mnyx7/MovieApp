//
//  ActorMoviewController.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 25.04.23.
//

import UIKit

class ActorMoviesController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    
    let cellId = "ActorsMovieCell"
    let viewModel = KnownForMovies()
    let apiUrl = "https://api.themoviedb.org/3/person/popular?api_key=e2253416fac0cd2476291eb33c92beb7"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureViewModel()
    }
    func configureUI() {
        collection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    func configureViewModel() {
        viewModel.getKnownFor()
        viewModel.successCallBack = {
            self.collection.reloadData()
        }
    }

}

extension ActorMoviesController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ActorMoviesCell
        cell.configure(data: viewModel.items[indexPath.item] as! KnownForProtocol)
        return cell
    }
    
    
}
