//
//  Movies.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 10.04.23.
//

import Foundation

class HomeViewModel {
    var items = [Result]()

   var successCallBack: (()->())?
   var errorCallBack: ((String)->())?
  
    func getPopularMovies() {
        NetworkManager.shared.request(model: MovieApp.self,
                                      url: NetworkHelper().self.URLconfig(path: "movie/popular")) { movieData, error in
            if let error = error {
              print("")
            } else if let movieData = movieData {
                self.items = movieData.results ?? []
            }
        }
    }
        
    
//    func getMovieItems() {
//
//        URLSession.shared.dataTask(with: url!) { data, response, error in
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let data = data {
//                do {
//                    self.movies = try JSONDecoder().decode([MovieApp].self, from: data)
//                    DispatchQueue.main.async {
//                        self.completion?()
//                    }
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//        }.resume()
//    }
}
