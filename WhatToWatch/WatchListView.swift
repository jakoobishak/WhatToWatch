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
    
    
    var body: some View {
        VStack(spacing: 0){
            List{
                if(!movieDetailsModel.remotes.isEmpty){
                    ForEach(likedMoviesList.indices) { i in
                        if let movie = movieDetailsModel.remotes[i].data{
                            NavigationLink(destination: AdditionalInfoView(movie: movie)){
                                Text("\(movie.title)")
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            movieDetailsModel.getMovieDetails(movies: likedMoviesList)
        }
    }
}

/*struct WatchListView_Previews: PreviewProvider {
 static var previews: some View {
 WatchListView()
 }
 }*/
