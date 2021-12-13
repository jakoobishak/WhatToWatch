//
//  FilterView.swift
//  WhatToWatch
//
//  Created by Jakoob Ishak on 2021-12-12.
//

import SwiftUI


struct FilterView: View {

    @AppStorage("action") var action = Bool()
    @AppStorage("adventure") var adventure = Bool()
    @AppStorage("animation") var animation = Bool()
    @AppStorage("score") var score: String = "1"
    @AppStorage("genres") var genres = [String]()
    @AppStorage("pageCounter") var pageCounter: Int = 1
    @AppStorage("counter") var counter = Int()
    
    @StateObject var movieModel = MovieModel()
    
    var allScores = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    @Binding var hasSaved: Bool
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 0) {
                    Text("Pick a movie score")
                    Picker(selection: $score, label: Text("Pick a movie score")) {
                        ForEach(allScores, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }
                
                
                Toggle("Action", isOn: $action).toggleStyle(SwitchToggleStyle(tint: Color.red)).padding(.trailing, 30)
                Toggle("Adventure", isOn: $adventure).toggleStyle(SwitchToggleStyle(tint: Color.purple)).padding(.trailing, 30)
                Toggle("Animation", isOn: $animation).toggleStyle(SwitchToggleStyle(tint: Color.orange)).padding(.trailing, 30)
                
                Button {
                    if(action == true){
                        genres.append("18")
                    } else {
                        if let index = genres.firstIndex(of: "18") {
                            genres.remove(at: index)
                        }
                    }
                    if(adventure == true){
                        genres.append("12")
                    } else {
                        if let index = genres.firstIndex(of: "12") {
                            genres.remove(at: index)
                        }
                    }
                    if(animation == true){
                        genres.append("16")
                    } else {
                        if let index = genres.firstIndex(of: "16") {
                            genres.remove(at: index)
                        }
                    }
                    
                    movieModel.filterMovies(genres: genres, score: Int(score)!)
                    hasSaved = true
                    pageCounter = 1
                    counter = 0
                    
                } label: {
                    Text("Save changes")
                }
                .padding(15)
                .foregroundColor(Color.black)
                .background(Color.green)
                .cornerRadius(60)

                
            }
        }
        .padding()
        
    }
        
}
