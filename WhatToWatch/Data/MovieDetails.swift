//
//  MovieDetails.swift
//  WhatToWatch
//
//  Created by Jakoob Ishak on 2021-12-06.
//

import Foundation

struct MovieDetails : Decodable, Identifiable {
    let id: Int
    let title: String
}
