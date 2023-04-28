//
//  ActorMoviesCell.swift
//  
//
//  Created by Minaya Yagubova on 25.04.23.
//

import UIKit
protocol ActorMoviesCellProtocol {
    var rating: String { get }
    var genre: String { get }
    var name: String { get }
    var duration: Double { get }
    var movieImage: String { get }
}

class ActorMoviesCell: UICollectionViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var genre: UIButton!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var name: UILabel!
    
    func configure(data: ActorMoviesCellProtocol) {
        name.text = data.name
        //genre.text = data.genre
        duration.text = "\(data.duration)"
        rating.text = data.rating
        movieImage.loadUrl(data.movieImage)
    }
}
