//
//  UIImageView + Extensions.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 22.04.23.
//

import Foundation
import SDWebImage

extension UIImageView {
    func loadUrl(_ posterPath: String) {
        let posterBaseURL = "https://image.tmdb.org/t/p/original"
        if let url = URL(string: posterBaseURL + posterPath) {
            self.sd_setImage(with: url)
        }
    }
}
