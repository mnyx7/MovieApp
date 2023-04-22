//
//  HomeCollectionViewCell.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 20.04.23.
//

import UIKit
import SDWebImage

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var horizontalScrollCV: UICollectionView!
    @IBOutlet private weak var categoryName: UILabel!
    
    private var movieItems = [Result]()
    
    let cellId = "\(HomeXibCollectionViewCell.self)"
    
    func configure(data: Category) {
        movieItems = data.items
        categoryName.text = data.title
        horizontalScrollCV.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
        horizontalScrollCV.reloadData()
    }
}

extension HomeCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeXibCollectionViewCell
//        cell.titleLabel.text = movieItems[indexPath.item].title
//        cell.posterImage.sd_setImage(with: URL(string: imageUrlString))
        cell.configure(data: movieItems[indexPath.item])

        //cell.backgroundColor = .red
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 167, height: collectionView.frame.height)
    }
}
