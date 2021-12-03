//
//  MovieDetailsModel.swift
//  WhatToWatch
//
//  Created by Jakoob Ishak on 2021-12-03.
//

import Foundation
import Combine

class MovieDetailsModel: ObservableObject {
    
    var getURL = "https://api.themoviedb.org/3/movie/19404?api_key=646d70ab25d3bc369aa0ed0b2ed9e2d8&language=en-US"

    private var cancellableTas: AnyCancellable?
    private var anyCancellable: AnyCancellable?
    
    var remote: Remote<MovieDetailsSet>
    
    func getMovieDetails(movieId:Int) {
        getURL = "https://api.themoviedb.org/3/movie/\(movieId)?api_key=646d70ab25d3bc369aa0ed0b2ed9e2d8&language=en-US"
        remote = Remote(url: URL(string: getURL)!)
        anyCancellable = remote.objectWillChange.sink(receiveValue: { [weak self] in
            self?.objectWillChange.send()
        })
    }
    
    init(){
        remote = Remote(url: URL(string: getURL)!)
        anyCancellable = remote.objectWillChange.sink(receiveValue: { [weak self] in
            self?.objectWillChange.send()
        })
    }
}
