//
//  SwipeView.swift
//  WhatToWatch
//
//  Created by Kyrollos Ceriacous on 2021-11-28.
//



/*
 
 Code inspiration regarding the overall design and layout provided by https://www.youtube.com/watch?v=9lVLFlyaiq4
 
 
 */

import SwiftUI

struct SwipeView: View {
    
    
    @State var showCover = false
    @State var nextMovie = false
    @State var hasSaved: Bool = false
    
    @StateObject var genreModel = GenreModel()
    @StateObject var movieModel = MovieModel()
    
    
    let buttonSymbols = ["hand.thumbsup.fill", "arrow.up.circle", "hand.thumbsdown.fill" ]
    let buttonColours = [Color.green, Color.orange, Color.red]
    
    @AppStorage("likedMoviesList") var likedMoviesList = [Int]()
    @AppStorage("dislikedMoviesList") var dislikedMoviesList = [Int]()
    @AppStorage("counter") var counter = Int()
    @AppStorage("genres") var genres = [String]()
    @AppStorage("score") var score: String = "1"
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        VStack(spacing: 0){
            
            if let movies = movieModel.remote.data?.results {
                
                
                Spacer()
                /*
                 Code inspiration regarding the implementation of the beneath function and button provided by https://www.youtube.com/watch?v=9lVLFlyaiq4
                 */
                    .fullScreenCover(isPresented: $showCover, content: {
                        ScrollView{
                            ZStack(alignment: .topLeading){
                                Color.clear
                                HStack{
                                    VStack(alignment: .leading){
                                        Button(action: {
                                            showCover.toggle()
                                        }, label: {
                                            Text("Close")
                                        })
                                    }
                                }
                                
                                Spacer()
                                
                                HStack {
                                    VStack {
                                        Section {
                                            Text("Title:").bold() + Text(" \(movies[counter].title)")
                                        }
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                        
                                        Section {
                                            Text("Average vote:").bold() + Text(" \(String(format: "%.1f", movies[counter].voteAverage))")
                                        }
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                        
                                        Section {
                                            Text("Vote count:").bold() + Text(" \(movies[counter].voteCount)")
                                        }
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                        
                                        Section {
                                            Text("Release date:").bold() + Text(" \(movies[counter].releaseDate)")
                                        }
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                        
                                        Section {
                                            Text("Description:").bold() + Text(" \(movies[counter].overview)")
                                        }
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                        
                                        Section {
                                            Text("Genres/categories:").bold()
                                            if let genres = genreModel.remote.data?.genres {
                                                ForEach(movies[counter].genreIds, id: \.self){ movieId in
                                                    ForEach(genres) { genre in
                                                        if(movieId == genre.id){
                                                            Text(genre.name)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    
                                }.padding()
                            }.frame(maxWidth: .infinity, maxHeight: .infinity).padding()
                            Spacer()
                        }
                    })
                
                Text(movies[counter].title)
                    .font(Font.headline.weight(.bold))
                    .underline()
                
                AsyncImage(url: URL(string: "https://www.themoviedb.org/t/p/w500" + (movies[counter].posterPath)), content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                }, placeholder: {ProgressView()})
                    .frame(maxWidth: 400, maxHeight: 1000)
                    .padding()
                
                HStack{
                    ForEach(0..<3){ index in
                        Button(action: {
                            if index == 0 {
                                if counter == 19 {
                                    likedMoviesList.append(movies[counter].id)
                                    movieModel.changeMoviesPage()
                                    counter = 0
                                } else {
                                    likedMoviesList.append(movies[counter].id)
                                    counter += 1
                                }
                            }
                            if index == 1 {
                                showCover.toggle()
                                genreModel.remote.fetch()
                                return
                            }
                            if index == 2 {
                                if counter == 19 {
                                    dislikedMoviesList.append(movies[counter].id)
                                    movieModel.changeMoviesPage()
                                    counter = 0
                                } else {
                                    dislikedMoviesList.append(movies[counter].id)
                                    counter += 1
                                }
                                
                            }
                        }, label: {
                            Spacer()
                            if index == 1{
                                Image(systemName: buttonSymbols[index])
                                    .font(.system(size: 120, weight: .bold))
                                    .frame(height: 200)
                                    .foregroundColor(buttonColours[index])
                            } else {
                                Image(systemName: buttonSymbols[index])
                                    .font(.system(size: 50, weight: .bold))
                                    .frame(height: 200)
                                    .foregroundColor(buttonColours[index])
                            }
                            
                            Spacer()
                            
                        })
                    }
                }
            }
        }
        .onAppear {
            if hasSaved == true {
                movieModel.filterMovies(genres: genres, score: Int(score)!)
            } else {
                movieModel.changeMoviesPage()
            }
            
        }
        .toolbar {
            
            NavigationLink {
                FilterView(hasSaved: $hasSaved)
                    .navigationBarTitle("Filter")
            } label: {
                Image(systemName: "line.3.horizontal")
            }
            
        }
    }
}
