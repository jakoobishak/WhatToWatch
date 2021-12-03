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
                
                Button{
                     //movieModel.changeMoviesPage()
                     //movieModel.remote.fetch()
                    movieDetailsModel.getMovieDetails(movieId: 19404)
                    movieDetailsModel.remote.fetch()
                    
                 } label: {
                     Text("Start swiping")
                 }
                
                
            }
            
        }
        
    }
}

/*struct WatchListView_Previews: PreviewProvider {
 static var previews: some View {
 WatchListView()
 }
 }*/
