//
//  PeopleMockManager.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 02.05.23.
//

import Foundation
class PeopleMockManager: PeopleManagerProtocol {
    static let shared = PeopleMockManager()
    
    func getPeople(page: Int, complete: @escaping ((People?, String?) -> ())) {
        if let file = Bundle.main.url(forResource: "People", withExtension: "json"),
            let data = try? Data(contentsOf: file)  {
            do {
                let people = try JSONDecoder().decode(People.self, from: data)
                complete(people,nil)
            } catch {
                complete(nil, error.localizedDescription)
            }
        }
    }
    
    func getKnownFor(id: Int, complete: @escaping ((ActorMovie?, String?) -> ())) {
        
    }
}
