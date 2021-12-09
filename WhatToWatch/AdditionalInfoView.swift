//
//  AdditionalInfoView.swift
//  WhatToWatch
//
//  Created by Kyrollos Ceriacous on 2021-11-28.
//

import SwiftUI

struct AdditionalInfoView: View {
    
    var movie : MovieDetails
    @ObservedObject var webViewModel = WebViewModel(url: "https://www.youtube.com/embed/1x0GpEZnwa8")
    
    var body: some View {
        
        
        
        ScrollView {
            VStack {
                Text(movie.title)
                
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
            }
        }
        
        ZStack {
            WebViewContainer(webViewModel: webViewModel)
            if webViewModel.isLoading {
                ProgressView()
                    .frame(height: 30)
            }
        }
        .navigationBarItems(leading: Button(action: {
            webViewModel.shouldGoBack.toggle()
        }, label: {
            if webViewModel.canGoBack {
                Image(systemName: "arrow.left")
                    .frame(width: 44, height: 44, alignment: .center)
                    .foregroundColor(.black)
            } else {
                EmptyView()
                    .frame(width: 0, height: 0, alignment: .center)
            }
        })
                            
        )
    }
}

/*struct AdditionalInfoView_Previews: PreviewProvider {
 static var previews: some View {
 AdditionalInfoView()
 }
 }*/
