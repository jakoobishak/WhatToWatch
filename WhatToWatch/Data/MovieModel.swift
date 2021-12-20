//
//  MovieModel.swift
//  WhatToWatch
//
//  Created by Jakoob Ishak on 2021-11-27.
//
import Foundation
import Combine
import SwiftUI

class MovieModel: ObservableObject {
    @AppStorage("pageCounter") var pageCounter: Int = 1
    @AppStorage("counter") var counter = Int()
    
    var getURL = "https://api.themoviedb.org/3/discover/movie?api_key=API_KEY&language=en-US&sort_by=popularity.desc&page=1"

    var remote: Remote<MovieSet>

    private var cancellableTas: AnyCancellable?
    private var anyCancellable: AnyCancellable?
    
    func changeMoviesPage() {
        if counter == 19 {
            pageCounter += 1
        }
        
        getURL = "https://api.themoviedb.org/3/discover/movie?api_key=API_KEY&language=en-US&sort_by=popularity.desc&page=\(pageCounter)"
        remote = Remote(url: URL(string: getURL)!)
        anyCancellable = remote.objectWillChange.sink(receiveValue: { [weak self] in
            self?.objectWillChange.send()
        })
        remote.fetch()
    }
    
    func filterMovies(genres: [String], score: Int) {
        if counter == 19 {
            pageCounter += 1
        }
        
        var allGenres = ""
        
        for genre in genres {
            if genre == genres.last {
                allGenres += genre
            } else {
                allGenres += genre + ","
            }
        }
        
        getURL = "https://api.themoviedb.org/3/discover/movie?api_key=API_KEY&language=en-US&sort_by=popularity.desc&page=\(pageCounter)&with_genres=\(allGenres)&vote_average.gte=\(score)"
        remote = Remote(url: URL(string: getURL)!)
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
