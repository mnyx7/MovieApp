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
    
    private var movieItems = [Result]()
    var viewModel = HomeViewModel()
    let cellId = "\(TopImageButtomLabelCell.self)"
    
    override func layoutSubviews() {
        horizontalScrollCV.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
        
    }
    
    func configure(data: Category) {
        movieItems = data.items
        categoryName.text = data.title
        horizontalScrollCV.reloadData()
    }
}

extension HomeCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TopImageButtomLabelCell
        cell.configure(data: movieItems[indexPath.item])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 167, height: collectionView.frame.height)
    }
}
