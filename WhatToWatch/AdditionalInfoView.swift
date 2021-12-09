//
//  AdditionalInfoView.swift
//  WhatToWatch
//
//  Created by Kyrollos Ceriacous on 2021-11-28.
//

import SwiftUI

struct AdditionalInfoView: View {
    
    var movie : MovieDetails
    
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
                
                NavigationLink {
                    TrailerView()
                } label: {
                    Text("Watch the trailer here")
                }

            }
        }
        .navigationTitle(movie.title)
        
    }
}
