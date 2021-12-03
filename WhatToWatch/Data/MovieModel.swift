//
//  MovieModel.swift
//  WhatToWatch
//
//  Created by Jakoob Ishak on 2021-11-27.
//
import Foundation
import Combine

class MovieModel: ObservableObject {
    
    var pageCount = 1
    
    var getURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=646d70ab25d3bc369aa0ed0b2ed9e2d8&language=en-US&page=1"

    private var cancellableTas: AnyCancellable?
    private var anyCancellable: AnyCancellable?
    
    var remote: Remote<MovieSet>
    
    func changeMoviesPage() {
        pageCount += 1
        getURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=646d70ab25d3bc369aa0ed0b2ed9e2d8&language=en-US&page=\(pageCount)"
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

