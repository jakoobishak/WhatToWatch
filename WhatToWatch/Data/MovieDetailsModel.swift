//
//  MovieDetailsModel.swift
//  WhatToWatch
//
//  Created by Jakoob Ishak on 2021-12-03.
//

import Foundation
import Combine
import SwiftUI

class MovieDetailsModel: ObservableObject {
    
    var getURL = "https://api.themoviedb.org/3/movie/19404?api_key=646d70ab25d3bc369aa0ed0b2ed9e2d8&language=en-US"
    
    private var cancellableTas: AnyCancellable?
    private var anyCancellable: AnyCancellable?
    
    var remotes: [Remote<MovieDetails>] = []
    
    func getMovieDetails(movies: [Int]) {
        
        for movie in movies {
            let detailsURL = "https://api.themoviedb.org/3/movie/\(movie)?api_key=646d70ab25d3bc369aa0ed0b2ed9e2d8&language=en-US"
            let remote = Remote<MovieDetails>(url: URL(string: detailsURL)!)
            self.remotes.append(remote)
            self.anyCancellable = remote.objectWillChange.sink(receiveValue: { [weak self] data in
                self?.objectWillChange.send()
            })
            remote.fetch()
        }
    }
    
    
    init(){
        //remotes = Remote(url: URL(string: getURL)!)
        //anyCancellable = remote.objectWillChange.sink(receiveValue: { [weak self] in
        //    self?.objectWillChange.send()
        //})
    }
}
