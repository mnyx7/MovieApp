//
//  knownFor.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 27.04.23.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let movieApp = try? JSONDecoder().decode(MovieApp.self, from: jsonData)

import Foundation

// MARK: - MovieApp
struct ActorMovie: Codable {
    let cast, crew: [Cast]?
    let id: Int?
}

// MARK: - Cast
struct Cast: Codable, ActorMoviesCellProtocol {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: String?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let character, creditID: String?
    let order: Int?
    let department, job: String?
    
    var rating: String {
        "\(voteAverage ?? 0.0)"
    }
    
    var genre: String {
        "---"
    }
    
    var name: String {
        originalTitle ?? ""
    }
    
    var duration: Double {
        0.0
    }
    
    var movieImage: String {
        posterPath ?? ""
    }

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case character
        case creditID = "credit_id"
        case order, department, job
    }
}
