//
//  HomeXibCollectionViewCell.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 20.04.23.
//


import UIKit

class HomeXibCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    
    
    func configure(data: Result) {
        titleLabel.text = data.title
        posterImage.loadUrl(data.posterPath ?? "")
        
        let postBaseUrl = "https://image.tmdb.otg/t/p/original"
        let imageUrlString  = postBaseUrl + (data.posterPath ?? "")
    }
}
