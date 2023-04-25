//
//  ActorMoviesViewModel.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 25.04.23.
//

import Foundation

struct KnownForStruct {
    let image: String
    let title: String
    let genre: String
    let rating: Double
    let duration: String
    let items: [KnownFor]
}

class KnownForMovies {
    
    var successCallBack: (()->())?
    var errorCallBack: ((String)->())?
    
    var items = [PeopleResult]()
    
    func getKnownFor() {
        NetworkManager.shared.request(model: People.self,
                                      url: NetworkHelper.shared.URLconfig(path: "person/popular")) { knownFor, error in
            if let error = error {
                print("")
            } else if let knownFor = knownFor {
                self.items = knownFor.results ?? []
               self.successCallBack?()
            }
        }
    }
}
