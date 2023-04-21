//
//  HomeCollectionViewCell.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 20.04.23.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var horizontalScrollCV: UICollectionView!
    @IBOutlet private weak var categoryName: UILabel!
    
    var items = [Result]()
    
    let cellId = "\(MovieCell.self)"
    //let cellId = "\(HomeXibCollectionViewCell.self)"
    
    func configure(data: Category) {
        items = data.items
        categoryName.text = data.title
        horizontalScrollCV.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
        horizontalScrollCV.reloadData()
    }
}

extension HomeCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeXibCollectionViewCell
        //   cell.movieName = movieModel.movies[indexPath.row].
        cell.backgroundColor = .red
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 167, height: collectionView.frame.height)
    }
}
