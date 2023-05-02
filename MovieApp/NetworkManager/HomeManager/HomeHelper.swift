//
//  HomeHelper.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 25.04.23.
//

import Foundation

enum HomeCategory: String {
    case popular = "home_category_popular"
    case topRated = "home_category_topRated"
}

enum HomeEndpoint: String {
    case popular = "movie/popular"
    case topRated = "movie/top_rated"
    var path: String {
        NetworkHelper.shared.URLconfig(path: self.rawValue)
    }
}
