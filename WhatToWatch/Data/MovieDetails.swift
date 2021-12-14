//
//  MovieDetails.swift
//  WhatToWatch
//
//  Created by Jakoob Ishak on 2021-12-06.
//

import Foundation

struct genreTypes : Decodable, Hashable {
    let id: Int
    let name: String
}

struct MovieDetails : Decodable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let releaseDate: String
    let voteAverage: Float
    let voteCount: Int
    let genres: [genreTypes]
}


