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
    @State var selectedIndex = 1
    
    let tabBarImages = ["heart.fill", "hand.draw", "trash.fill"]
    let tabBarColours = [Color.red, Color.yellow, Color.blue]
    
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                switch selectedIndex{
                case 0:
                    WatchListView()
                        .navigationTitle("Watchlist")
                case 1:
                    SwipeView()
                        .navigationTitle("Let's Swipe!")
                case 2:
                    TrashListView()
                        .navigationTitle("Trashlist")
                default:
                    SwipeView()
                        .navigationTitle("Let's Swipe!")
                }
            }
            
            Divider()
                .padding(.bottom, 8)
            
            HStack{
                ForEach(0..<3){ index in
                    Button(action: {
                        selectedIndex = index
                        if index == 0 {
                        }
                    }, label: {
                        Spacer()
                        if index == 1{
                            Image(systemName: tabBarImages[index])
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(selectedIndex == index ? tabBarColours[index] : .init(white: 0.8))
                        } else {
                            Image(systemName: tabBarImages[index])
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(selectedIndex == index ? tabBarColours[index] : .init(white: 0.8))
                        }
                        Spacer()
                    })
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
