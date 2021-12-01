//
//  GenreModel.swift
//  WhatToWatch
//
//  Created by Jakoob Ishak on 2021-12-01.
//

import Foundation
import Combine

class GenreModel: ObservableObject {
    
    let getURL = "https://api.themoviedb.org/3/movie/80341?api_key=646d70ab25d3bc369aa0ed0b2ed9e2d8&language=en-US"
    
    private var cancellableTas: AnyCancellable?
    private var anyCancellable: AnyCancellable?
    
    let remote: Remote<GenreSet>
    
    init(){
        remote = Remote(url: URL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=646d70ab25d3bc369aa0ed0b2ed9e2d8&language=en-US")!)
        anyCancellable = remote.objectWillChange.sink(receiveValue: { [weak self] in
            self?.objectWillChange.send()
        })
    }
}