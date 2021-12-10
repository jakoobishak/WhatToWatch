//
//  MovieTrailerModel.swift
//  WhatToWatch
//
//  Created by Jakoob Ishak on 2021-12-10.
//

import Foundation
import Combine
import SwiftUI

class MovieTrailerModel: ObservableObject {
    
    @AppStorage("pageCounter") var pageCounter: Int = 1
    @AppStorage("counter") var counter = Int()
    
    //https://www.youtube.com/embed/
    
    var getURL = "https://api.themoviedb.org/3/movie/223/videos?api_key=646d70ab25d3bc369aa0ed0b2ed9e2d8&language=en-US"
    
    private var cancellableTas: AnyCancellable?
    private var anyCancellable: AnyCancellable?
    
    var remote: Remote<MovieTrailerSet>
    
    func getMovieTrailer(movieId: Int) {
        
        let trailerURL = "https://api.themoviedb.org/3/movie/\(movieId)/videos?api_key=646d70ab25d3bc369aa0ed0b2ed9e2d8&language=en-US"
        remote = Remote(url: URL(string: trailerURL)!)
        anyCancellable = remote.objectWillChange.sink(receiveValue: { [weak self] in
            self?.objectWillChange.send()
        })
        remote.fetch()
        
    }
    
    init(){
        remote = Remote(url: URL(string: getURL)!)
        anyCancellable = remote.objectWillChange.sink(receiveValue: { [weak self] in
            self?.objectWillChange.send()
        })
    }
}
