//
//  Movie.swift
//  WhatToWatch
//
//  Created by Jakoob Ishak on 2021-11-27.
//

import Foundation

struct Movie : Decodable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let voteAverage: Float
    let voteCount: Int
}
