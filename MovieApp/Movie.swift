//
//  Movie.swift
//  MovieApp
//
//  Created by Süleyman Ayyılmaz on 26.01.2024.
//

import Foundation

struct Movie: Codable {
    let title: String
    let year: String
    let imdb: String
    let type: String
    let poster: String

    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdb = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}

struct ListMovies: Codable {
    let movies: [Movie] // Renamed from "Movies"

    private enum CodingKeys: String, CodingKey {
        case movies = "Search" // Renamed from "Movies"
    }
}








