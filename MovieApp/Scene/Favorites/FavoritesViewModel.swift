//
//  FavoritesViewModel.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 20.04.23.
//

import Foundation

class FavoritesViewModel {
    

    func getFavoriteMovies() {
        NetworkManager.shared.request(model: String.self,
                                      url: NetworkHelper().self.URLconfig(path: "favorite")) { data, error in
        }

    }
}
