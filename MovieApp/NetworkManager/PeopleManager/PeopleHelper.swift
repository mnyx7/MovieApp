//
//  PeopleHelper.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 27.04.23.
//

import Foundation

enum PeopleEndpoint: String {
    case personPopular = "person/popular"
    
    var path: String {
        NetworkHelper.shared.URLconfig(path: self.rawValue)
    }
}
