//
//  AdditionalInfoView.swift
//  WhatToWatch
//
//  Created by Kyrollos Ceriacous on 2021-11-28.
//

import SwiftUI



struct AdditionalInfoView: View {
    
    var movie : MovieDetails
    let objectToRemove = 0
    
    
    
    @StateObject var movieTrailerModel = MovieTrailerModel()
    @AppStorage("likedMoviesList") var likedMoviesList = [Int]()
    
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://www.themoviedb.org/t/p/w500" + (movie.posterPath)), content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                }, placeholder: {ProgressView()})
                    .frame(maxWidth: 500, maxHeight: 400)
                    .padding()
                
                Text(movie.title)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .multilineTextAlignment(.center)
                    .padding(20)
                
                Text("\(String(format: "%.1f", movie.voteAverage))")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .multilineTextAlignment(.center)
                    .padding(20)
                
                Text("\(movie.voteCount)")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .multilineTextAlignment(.center)
                    .padding(20)
                
                Text(movie.releaseDate)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .multilineTextAlignment(.center)
                    .padding(20)
                
                Text(movie.overview)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .multilineTextAlignment(.center)
                    .padding(20)
                
                ForEach(movie.genres, id: \.self) { genre in
                    Text("\(genre.name)")
                }
                
                Spacer()
                /*
                 if let movieTrailer = movieTrailerModel.remote.data?.results{
                 NavigationLink(destination: TrailerView(trailer: movieTrailer[0], webViewModel: WebViewModel(url: "https://www.youtube.com/embed/" + movieTrailer[0].key))) {
                 Text("\(movieTrailer[0].name)")
                 
                 }
                 
                 }
                 
                 */
            }
        }
        .toolbar {
            /*
             let objectToRemove = movie.id
             likedMoviesList.remove(object: objectToRemove)
             */
            
            Button(action: {
                if likedMoviesList.contains(movie.id){
                    likedMoviesList.removeAll(where: {$0 == movie.id})
                } else{
                    likedMoviesList.append(movie.id)
                }
            }, label: {
                if likedMoviesList.contains(movie.id){
                    Image(systemName: "heart.fill")
                    
                } else {
                    Image(systemName: "heart")
                }
                
            })
            
        }
        .navigationTitle(movie.title)
        .onAppear{
            movieTrailerModel.getMovieTrailer(movieId: movie.id)
        }
    }
}
