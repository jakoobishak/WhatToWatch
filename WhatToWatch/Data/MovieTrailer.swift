//
//  MovieTrailer.swift
//  WhatToWatch
//
//  Created by Jakoob Ishak on 2021-12-10.
//

import Foundation

struct MovieTrailer : Decodable, Identifiable {
    let id: String
    let name: String
    let key: String
}
