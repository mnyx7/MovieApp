//
//  PeopleManagerProtocol.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 02.05.23.
//

import Foundation

protocol PeopleManagerProtocol {
    func getPeople(page: Int, complete: @escaping((People?, String?)->()))
    func getKnownFor(id: Int, complete: @escaping((ActorMovie?, String?)->()))
}
