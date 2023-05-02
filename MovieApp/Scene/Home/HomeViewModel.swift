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
    var items = [Category]()
    
    var successCallBack: (()->())?
    var errorCallBack: ((String)->())?
    
    func getItems() {
        getMovieItems(category: .topRated)
        getMovieItems(category: .popular)
    }
    
    private func getMovieItems(category: HomeCategory) {
        HomeManager.shared.getMovieItems(category: category) { movieData, error in
            if let error = error {
                self.errorCallBack?(error)
            } else if let movieData = movieData {
                //                self.items = movieData.results ?? []
                self.items.append(Category(title: category.rawValue.localize,
                                           items: movieData.results ?? []))
                self.successCallBack?()
            }
        }
    }
    
//    func getPopularMovies() {
//        NetworkManager.shared.request(model: MovieApp.self,
//                                      url: NetworkHelper.shared.URLconfig(path: "movie/popular")) { movieData, error in
//            if let error = error {
//                print("")
//            } else if let movieData = movieData {
//                //                self.items = movieData.results ?? []
//                self.items.append(Category(title: "Popular", items: movieData.results ?? []))
//                self.successCallBack?()
//            }
//        }
//    }
//
//    func getTopRatedMovies() {
//        NetworkManager.shared.request(model: MovieApp.self,
//                                      url: NetworkHelper.shared.URLconfig(path: "movie/top_rated")) { movieData, error in
//            if let error = error {
//                print("")
//            } else if let movieData = movieData {
//                //                self.items = movieData.results ?? []
//                self.items.append(Category(title: "Top Rated", items: movieData.results ?? []))
//
//                self.successCallBack?()
//            }
//        }
//    }
}
