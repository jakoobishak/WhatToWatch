//
//  AdditionalInfoView.swift
//  WhatToWatch
//
//  Created by Kyrollos Ceriacous on 2021-11-28.
//

import SwiftUI

struct AdditionalInfoView: View {
    var movie : MovieDetails
    
    @StateObject var movieTrailerModel = MovieTrailerModel()
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://www.themoviedb.org/t/p/w500" + (movie.posterPath)), content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                }, placeholder: {ProgressView()})
                    .frame(maxWidth: 500, maxHeight: 400)
                    .padding()
                Section {
                    Text("Title:").bold() + Text(" \(movie.title)")
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
                .padding(20)
                
                Section {
                    Text("Average vote:").bold() + Text(" \(String(format: "%.1f", movie.voteAverage))")
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
                .padding(20)
                
                Section {
                    Text("Vote count:").bold() + Text(" \(movie.voteCount)")
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
                .padding(20)
                
                Section {
                    Text("Release date:").bold() + Text(" \(movie.releaseDate)")
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
                .padding(20)
                
                Section {
                    Text("Description:").bold() + Text(" \(movie.overview)")
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
                .padding(20)
                
                Section {
                    Text("Genres/categories:").bold()
                    ForEach(movie.genres, id: \.self) { genre in
                        Text("\(genre.name)")
                    }
                }
                
                Spacer()
                
                Section {
                    if let movieTrailer = movieTrailerModel.remote.data?.results{
                        if !movieTrailer.isEmpty {
                            NavigationLink(destination: TrailerView(trailer: movieTrailer[0], webViewModel: WebViewModel(url: "https://www.youtube.com/embed/" + movieTrailer[0].key))) {
                                Text("Tap here to view the trailer")
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle(movie.title)
        .onAppear{
            movieTrailerModel.getMovieTrailer(movieId: movie.id)
        }
    }
}
