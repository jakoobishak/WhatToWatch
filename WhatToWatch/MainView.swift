//
//  MainView.swift
//  WhatToWatch
//
//  Created by Kyrollos Ceriacous on 2021-11-28.s
//


/*
 
 Code inspiration regarding the overall design and layout provided by https://www.youtube.com/watch?v=9lVLFlyaiq4
 
 
 */


import SwiftUI

struct MainView: View {
    //var movie : Movie
    @State var selectedIndex = 0
    
    let tabBarImages = ["heart.rectangle", "hand.draw", "trash.square"]
    let tabBarColours = [Color.red, Color.yellow, Color.blue]
    
    init(){
        UITabBar.appearance().barTintColor = .systemBackground
        UINavigationBar.appearance().barTintColor = .systemBackground
    }
    
    
    var body: some View {
        //Text(movie.title)
        
        VStack{
            ZStack{
                switch selectedIndex{
                case 0:
                    List{
                        ForEach(0..<9){ index in
                            Text("Movie in watch list \(index)")
                        }
                        .navigationTitle("Watch list")

                    }
                case 1:
                    Text("Next view where one can swipe")
                        .navigationTitle("Start swiping!")

                
                case 2:
                    Text("The trashlist bro")
                        .navigationTitle("The trash list maaaaan")
                
                default:
                    List{
                        ForEach(0..<9){ index in
                            Text("Movie in watch list \(index)")
                        }
                        .navigationTitle("Watch list")

                    }
                        .navigationTitle("Start swiping! (default)")

                }
            }
            
            Spacer()
            
            HStack{
                ForEach(0..<3){ index in
                    Button(action: {
                        selectedIndex = index
                    }, label: {
                        Spacer()
                        Image(systemName: tabBarImages[index])
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(selectedIndex == index ? tabBarColours[index] : .init(white: 0.8))
                        Spacer()
                    })
                }
            }
            
            
        }
            .navigationBarBackButtonHidden(true)
    }
}


/*
 
 @StateObject var movieModel = MovieModel()
 
 
 struct declaration HERE!!!!
 
 NavigationView {
 VStack{
 Button{
 movieModel.remote.fetch()
 } label: {
 Text("Start swiping")
 }
 
 if let movies = movieModel.remote.data?.results {
 ForEach(movies){ movie in
 NavigationLink(destination: MainView(movie: movie)) {
 Text("TJENA")
 }
 }
 }
 
 }
 
 
 }
 
 
 
 
 */


/*
 struct MainView_Previews: PreviewProvider {
 static var previews: some View {
 MainView()
 }
 }
 */
