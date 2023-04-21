//
//  Movies.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 10.04.23.
//

import Foundation

struct Category {
    let title: String
    let items: [Result]
}

class HomeViewModel {    
    var categoryItems = [Category]()
    
    var successCallBack: (()->())?
    var errorCallBack: ((String)->())?
    
    func getPopularMovies() {
        NetworkManager.shared.request(model: MovieApp.self,
                                      url: NetworkHelper.shared.URLconfig(path: "movie/popular")) { movieData, error in
            if let error = error {
                print("")
            } else if let movieData = movieData {
                //                self.items = movieData.results ?? []
                self.categoryItems.append(Category(title: "Popular", items: movieData.results ?? []))
                
                self.successCallBack?()
            }
        }
    }
    
    func getTopRatedMovies() {
        NetworkManager.shared.request(model: MovieApp.self,
                                      url: NetworkHelper.shared.URLconfig(path: "movie/top_rated")) { movieData, error in
            if let error = error {
                print("")
            } else if let movieData = movieData {
                //                self.items = movieData.results ?? []
                self.categoryItems.append(Category(title: "Top Rated", items: movieData.results ?? []))
                
                self.successCallBack?()
            }
        }
    }
}
