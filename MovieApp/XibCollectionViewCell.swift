//
//  XibCollectionViewCell.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 10.04.23.
//

import UIKit

class XibCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var seeMoreButton: UIButton!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var movieName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
