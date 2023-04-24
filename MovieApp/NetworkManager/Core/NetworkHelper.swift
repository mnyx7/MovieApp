//
//  NetworkHelper.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 20.04.23.
//

import Foundation

class NetworkHelper {
    static let shared = NetworkHelper()
    
    let baseURL = "https://api.themoviedb.org/3/"
    let apiKey = "e2253416fac0cd2476291eb33c92beb7"
    let imageBaseUrl = "https://image.tmdb.org/t/p/original/"
    
    func URLconfig(path: String) -> String {
     baseURL + path + "?api_key=\(apiKey)"
    }
}
