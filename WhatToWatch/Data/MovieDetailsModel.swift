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
    
    var remote: Remote<MovieDetails>
    

    
    func getMovieDetails(movies: [Int]) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            let detailsURL = "https://api.themoviedb.org/3/movie/\(movies[0])?api_key=646d70ab25d3bc369aa0ed0b2ed9e2d8&language=en-US"
            self.remote = Remote(url: URL(string: detailsURL)!)
            self.anyCancellable = self.remote.objectWillChange.sink(receiveValue: { [weak self] in
                self?.objectWillChange.send()
            })
            self.remote.fetch()

            print(movies[0])
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            let detailsURL = "https://api.themoviedb.org/3/movie/\(movies[1])?api_key=646d70ab25d3bc369aa0ed0b2ed9e2d8&language=en-US"
            self.remote = Remote(url: URL(string: detailsURL)!)
            self.anyCancellable = self.remote.objectWillChange.sink(receiveValue: { [weak self] in
                self?.objectWillChange.send()
            })
            self.remote.fetch()

            print(movies[1])
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 15.0) {
            let detailsURL = "https://api.themoviedb.org/3/movie/\(movies[2])?api_key=646d70ab25d3bc369aa0ed0b2ed9e2d8&language=en-US"
            self.remote = Remote(url: URL(string: detailsURL)!)
            self.anyCancellable = self.remote.objectWillChange.sink(receiveValue: { [weak self] in
                self?.objectWillChange.send()
            })
            self.remote.fetch()

            print(movies[2])
        }
        
        /*for movie in movies {
            
        }*/
    }
    
    init(){
        remote = Remote(url: URL(string: getURL)!)
        anyCancellable = remote.objectWillChange.sink(receiveValue: { [weak self] in
            self?.objectWillChange.send()
        })
    }
}
