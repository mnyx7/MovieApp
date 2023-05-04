//
//  PeopleManager.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 26.04.23.
//

import Foundation

class PeopleManager: PeopleManagerProtocol {
    static let shared = PeopleManager()
    
    func getPeople(page: Int, complete: @escaping((People?, String?)->())) {
        let url = PeopleEndpoint.personPopular.path + "&page=\(page)"
        print("url: \(url)")
        NetworkManager.shared.request(model: People.self,
                                      url: PeopleEndpoint.personPopular.path + "&page=\(page)",
                                      complete: complete)
    }
    
    func getKnownFor(id: Int, complete: @escaping((ActorMovie?, String?)->())) {
        NetworkManager.shared.request(model: ActorMovie.self,
                                      url: NetworkHelper.shared.URLconfig(path: "person/\(id)/movie_credits"),
                                      complete: complete)
    }
    
}

