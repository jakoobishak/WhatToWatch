//
//  WatchListView.swift
//  WhatToWatch
//
//  Created by Kyrollos Ceriacous on 2021-11-28.
//

import SwiftUI

struct WatchListView: View {
    @StateObject var movieDetailsModel = MovieDetailsModel()
    
    @AppStorage("likedMoviesList") var likedMoviesList = [Int]()
    
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 0) {
            List{
                if(!movieDetailsModel.remotes.isEmpty) {
                    ForEach(Array(zip(likedMoviesList, likedMoviesList.indices)), id: \.0) { likedMovie, index in
                        if let movie = movieDetailsModel.remotes[index].data {
                            NavigationLink(destination: AdditionalInfoView(movie: movie)) {
                                Text("\(movie.title)")
                            }
                        }
                    }
                    .onDelete(perform: delete)
                }
            }
        }
        .onAppear {
            movieDetailsModel.getMovieDetails(movies: likedMoviesList)
        }
        .toolbar {
            Button {
                showAlert = true
            } label : {
                Image(systemName: "trash")
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Empty the list?"),
                    message: Text("Are you sure you want to empty your list?"),
                    primaryButton: .destructive(Text("Yes")) {
                        self.likedMoviesList.removeAll()
                        self.movieDetailsModel.remotes.removeAll()
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        likedMoviesList.remove(atOffsets: offsets)
        movieDetailsModel.remotes.remove(atOffsets: offsets)
    }
}


