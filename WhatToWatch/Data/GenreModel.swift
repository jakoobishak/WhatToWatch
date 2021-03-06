//
//  GenreModel.swift
//  WhatToWatch
//
//  Created by Jakoob Ishak on 2021-12-01.
//

import Foundation
import Combine

class GenreModel: ObservableObject {
    let getURL = "https://api.themoviedb.org/3/genre/movie/list?api_key=API_KEY8&language=en-US"
    let remote: Remote<GenreSet>
    
    private var cancellableTas: AnyCancellable?
    private var anyCancellable: AnyCancellable?
    
    init(){
        remote = Remote(url: URL(string: getURL)!)
        anyCancellable = remote.objectWillChange.sink(receiveValue: { [weak self] in
            self?.objectWillChange.send()
        })
    }
}
