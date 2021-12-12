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
            List{
                if(!movieDetailsModel.remotes.isEmpty) {
                    ForEach(Array(zip(dislikedMoviesList, dislikedMoviesList.indices)), id: \.0) { dislikedMovie, index in
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
            movieDetailsModel.getMovieDetails(movies: dislikedMoviesList)
        }
    }
    
    func delete(at offsets: IndexSet) {
        dislikedMoviesList.remove(atOffsets: offsets)
        movieDetailsModel.remotes.remove(atOffsets: offsets)
    }
}

struct TrashListView_Previews: PreviewProvider {
    static var previews: some View {
        TrashListView()
    }
}
