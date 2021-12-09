//
//  TrashListView.swift
//  WhatToWatch
//
//  Created by Kyrollos Ceriacous on 2021-11-28.
//

import SwiftUI

struct TrashListView: View {
    @StateObject var movieDetailsModel = MovieDetailsModel()
    @AppStorage("dislikedMoviesList") var dislikedMoviesList = [Int]()
    
    var body: some View {
        VStack(spacing: 0){
            List {
                Section(header: Text("I don't want to watch these!")){
                    if(!movieDetailsModel.remotes.isEmpty){
                        ForEach(dislikedMoviesList.indices) { i in
                            if let movie = movieDetailsModel.remotes[i].data{
                                NavigationLink(destination: AdditionalInfoView(movie: movie)){
                                    Text("\(movie.title)")
                                }
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            movieDetailsModel.getMovieDetails(movies: dislikedMoviesList)
        }
    }
}

struct TrashListView_Previews: PreviewProvider {
    static var previews: some View {
        TrashListView()
    }
}
