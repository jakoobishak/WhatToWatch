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
                
                if let movieDetails = movieDetailsModel.remote.data {
                    Text("\(movieDetails.title)")
                }
                
                Button{
                     //movieModel.changeMoviesPage()
                     //movieModel.remote.fetch()
                    
                 } label: {
                     Text("Start swiping")
                 }
            }
            
        }
        .onAppear {

            
            movieDetailsModel.getMovieDetails(movies: likedMoviesList)
            //movieDetailsModel.remote.fetch()
        }
    }
}

/*struct WatchListView_Previews: PreviewProvider {
 static var previews: some View {
 WatchListView()
 }
 }*/
