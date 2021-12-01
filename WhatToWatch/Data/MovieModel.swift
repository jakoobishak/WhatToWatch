//
//  MovieModel.swift
//  WhatToWatch
//
//  Created by Jakoob Ishak on 2021-11-27.
//
import Foundation
import Combine

class MovieModel: ObservableObject {
    //@Published var movies: MovieSet?
    
    //let getURL2 = "https://pixelkind.github.io/ju-iOS-Development-2021/FoodGuide/restaurants.json"
    
    let getURL = "https://api.themoviedb.org/3/movie/80341?api_key=646d70ab25d3bc369aa0ed0b2ed9e2d8&language=en-US"
    
    private var cancellableTas: AnyCancellable?
    private var anyCancellable: AnyCancellable?
    private var pageCount = 1
    
    let remote: Remote<MovieSet>
    
    init(){
        remote = Remote(url: URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=646d70ab25d3bc369aa0ed0b2ed9e2d8&language=en-US&page=\(pageCount)")!)
        pageCount += 1
        anyCancellable = remote.objectWillChange.sink(receiveValue: { [weak self] in
            self?.objectWillChange.send()
        })
    }
}

