//
//  SwipeView.swift
//  WhatToWatch
//
//  Created by Kyrollos Ceriacous on 2021-11-28.
//



/*
 
 Code inspiration regarding the overall design and layout provided by https://www.youtube.com/watch?v=9lVLFlyaiq4
 
 Code inspiration regarding the implementation of the beneath function and button provided by https://www.youtube.com/watch?v=9lVLFlyaiq4
 */

import SwiftUI

struct SwipeView: View {
    
    @State var showCover = false
    
    let buttonSymbols = ["hand.thumbsup.fill", "arrow.up.circle", "hand.thumbsdown.fill" ]
    let buttonColours = [Color.green, Color.black, Color.red]
    
    var body: some View {
        VStack(spacing: 0){
            Spacer()
                .fullScreenCover(isPresented: $showCover, content: {
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
                            Text("Cast: Tom Holland (Spider-Man/Peter Parker), Zendaya (as Michelle 'MJ'), Tobey Maguire (as The OG Spidey).")
                                .frame(maxWidth: .infinity, alignment: .center)
                                .multilineTextAlignment(.center)
                                .padding(20)
                        }.padding(20)
                        
                    }.frame(maxWidth: .infinity, maxHeight: .infinity).padding()
                        
                    Spacer()
                })
            Image("SMFFH")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 800, maxHeight: 600)
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

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
