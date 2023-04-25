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
