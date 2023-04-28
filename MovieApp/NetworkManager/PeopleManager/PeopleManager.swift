//
//  PeopleManager.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 26.04.23.
//

import Foundation
class PeopleManager {
    static let shared = PeopleManager()
    
    func getPeople(complete: @escaping((People?, String?)->())) {
        NetworkManager.shared.request(model: People.self,
                                      url: PeopleEndpoint.personPopular.path,
                                      complete: complete)
    }
    func getKnownFor(id: Int, complete: @escaping((ActorMovie?, String?)->())) {
        NetworkManager.shared.request(model: ActorMovie.self,
                                      url: NetworkHelper.shared.URLconfig(path: "person/\(id)/movie_credits"),
                                      complete: complete)
    }
    
}
