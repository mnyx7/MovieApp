//
//  TopImageButtomLabelCell.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 22.04.23.
//

import UIKit
  protocol TopImageBottomLabelCellProtocolTest {
      var titleText: String { get }
  }

  protocol TopImageBottomLabelCellProtocol {
      var titleText: String { get }
      var imageUrl: String { get }
  }

class TopImageButtomLabelCell: UICollectionViewCell {
    
    override func layoutSubviews() {
        topImage.layer.cornerRadius = 20
    }

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var topImage: UIImageView!
  
    
    func configure(data: TopImageBottomLabelCellProtocol) {
        titleLabel.text = data.titleText
        topImage.loadUrl(data.imageUrl)
    }
}
