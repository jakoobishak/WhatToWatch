//
//  MovieSet.swift
//  WhatToWatch
//
//  Created by Jakoob Ishak on 2021-11-27.
//

import Foundation

struct MovieSet: Decodable {
    let results: [Movie]
    let totalResults: Int
}
