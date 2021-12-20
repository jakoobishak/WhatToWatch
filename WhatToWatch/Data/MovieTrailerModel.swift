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
    
    var getURL = "https://api.themoviedb.org/3/movie/223/videos?api_key=API_KEY&language=en-US"
    var remote: Remote<MovieTrailerSet>
    
    private var cancellableTas: AnyCancellable?
    private var anyCancellable: AnyCancellable?
    
    func getMovieTrailer(movieId: Int) {
        
        let trailerURL = "https://api.themoviedb.org/3/movie/\(movieId)/videos?api_key=API_KEY&language=en-US"
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
