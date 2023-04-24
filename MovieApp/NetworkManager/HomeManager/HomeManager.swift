//
//  HomeManager.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 25.04.23.
//

import Foundation
class HomeManager {
    static let shared = HomeManager()
    
    func getMovieItems(category: HomeCategory, complete: @escaping((MovieApp?, String?)->())) {
        var url = ""
        switch category {
        case .popular:
            url = HomeEndpoint.popular.path
        case .topRated:
            url = HomeEndpoint.topRated.path
        }
        NetworkManager.shared.request(model: MovieApp.self,
                                      url: url,
                                      complete: complete)
    }
}
