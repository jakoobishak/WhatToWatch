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
    
    let buttonSymbols = ["hand.thumbsup.fill", "arrow.up.circle", "hand.thumbsdown.fill" ]
    let buttonColours = [Color.green, Color.black, Color.red]
    
    var movie: Movie
    
    var body: some View {
        VStack(spacing: 0){
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
                            
                            HStack{
                                VStack{
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
                                }
                                
                            }.padding(20)
                            
                        }.frame(maxWidth: .infinity, maxHeight: .infinity).padding()
                            
                        Spacer()
                    }
                    
                })
            
            Text(movie.title)
    
            AsyncImage(url: URL(string: "https://www.themoviedb.org/t/p/w500" + movie.posterPath), content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            }, placeholder: {ProgressView()})
                .frame(maxWidth: 500, maxHeight: 400)
                .padding()
                
                
            
            HStack{
                ForEach(0..<3){ index in
                    Button(action: {
                        //TODO REST OF THE BUTTONS!!!!!!!
                        if index == 1{
                            showCover.toggle()
                            return
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
}

/*struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}*/
