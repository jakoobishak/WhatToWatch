//
//  FilterView.swift
//  WhatToWatch
//
//  Created by Jakoob Ishak on 2021-12-12.
//

import SwiftUI


struct FilterView: View {
    @AppStorage("likedMoviesList") var likedMoviesList = [Int]()
    @AppStorage("dislikedMoviesList") var dislikedMoviesList = [Int]()
    
    //genres/categories
    @AppStorage("action") var action = Bool()
    @AppStorage("adventure") var adventure = Bool()
    @AppStorage("animation") var animation = Bool()
    @AppStorage("comedy") var comedy = Bool()
    @AppStorage("crime") var crime = Bool()
    @AppStorage("documentary") var documentary = Bool()
    @AppStorage("drama") var drama = Bool()
    @AppStorage("family") var family = Bool()
    @AppStorage("fantasy") var fantasy = Bool()
    @AppStorage("history") var history = Bool()
    @AppStorage("horror") var horror = Bool()
    @AppStorage("music") var music = Bool()
    @AppStorage("mystery") var mystery = Bool()
    @AppStorage("romance") var romance = Bool()
    @AppStorage("scifi") var scifi = Bool()
    @AppStorage("thriller") var thriller = Bool()
    @AppStorage("war") var war = Bool()
    @AppStorage("western") var western = Bool()
    
    @AppStorage("score") var score: String = "1"
    @AppStorage("genres") var genres = [String]()
    @AppStorage("pageCounter") var pageCounter: Int = 1
    @AppStorage("counter") var counter = Int()
    @AppStorage("hasSavedFilter") var hasSavedFilter = Bool()
    
    
    @StateObject var movieModel = MovieModel()
    
    @State var filterChanged = false
    @State var totalMovies = 20
    
    var allScores = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
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
                
                Group {
                    Toggle("Action", isOn: $action).toggleStyle(SwitchToggleStyle(tint: Color.red)).padding(.trailing, 30)
                    Toggle("Adventure", isOn: $adventure).toggleStyle(SwitchToggleStyle(tint: Color.purple)).padding(.trailing, 30)
                    Toggle("Animation", isOn: $animation).toggleStyle(SwitchToggleStyle(tint: Color.orange)).padding(.trailing, 30)
                    Toggle("Comedy", isOn: $comedy).toggleStyle(SwitchToggleStyle(tint: Color.blue)).padding(.trailing, 30)
                    Toggle("Crime", isOn: $crime).toggleStyle(SwitchToggleStyle(tint: Color.brown)).padding(.trailing, 30)
                    Toggle("Documentary", isOn: $documentary).toggleStyle(SwitchToggleStyle(tint: Color.cyan)).padding(.trailing, 30)
                    Toggle("Drama", isOn: $drama).toggleStyle(SwitchToggleStyle(tint: Color.pink)).padding(.trailing, 30)
                    Toggle("Family", isOn: $family).toggleStyle(SwitchToggleStyle(tint: Color.gray)).padding(.trailing, 30)
                    Toggle("Fantasy", isOn: $fantasy).toggleStyle(SwitchToggleStyle(tint: Color.yellow)).padding(.trailing, 30)
                    Toggle("History", isOn: $history).toggleStyle(SwitchToggleStyle(tint: Color.indigo)).padding(.trailing, 30)
                }
                Group {
                    Toggle("Horror", isOn: $horror).toggleStyle(SwitchToggleStyle(tint: Color.mint)).padding(.trailing, 30)
                    Toggle("Music", isOn: $music).toggleStyle(SwitchToggleStyle(tint: Color.teal)).padding(.trailing, 30)
                    Toggle("Mystery", isOn: $mystery).toggleStyle(SwitchToggleStyle(tint: Color.green)).padding(.trailing, 30)
                    Toggle("Romance", isOn: $romance).toggleStyle(SwitchToggleStyle(tint: Color.blue)).padding(.trailing, 30)
                    Toggle("SciFi", isOn: $scifi).toggleStyle(SwitchToggleStyle(tint: Color.mint)).padding(.trailing, 30)
                    Toggle("Thriller", isOn: $thriller).toggleStyle(SwitchToggleStyle(tint: Color.orange)).padding(.trailing, 30)
                    Toggle("War", isOn: $war).toggleStyle(SwitchToggleStyle(tint: Color.red)).padding(.trailing, 30)
                    Toggle("Western", isOn: $western).toggleStyle(SwitchToggleStyle(tint: Color.yellow)).padding(.trailing, 30)
                }
                
                
                Button {
                    if(action == true){
                        if !genres.contains("28"){
                            genres.append("28")
                        }
                    } else {
                        if let index = genres.firstIndex(of: "28") {
                            genres.remove(at: index)
                        }
                    }
                    if(adventure == true){
                        if !genres.contains("12"){
                            genres.append("12")
                        }
                    } else {
                        if let index = genres.firstIndex(of: "12") {
                            genres.remove(at: index)
                        }
                    }
                    if(animation == true){
                        if !genres.contains("16"){
                            genres.append("16")
                        }
                    } else {
                        if let index = genres.firstIndex(of: "16") {
                            genres.remove(at: index)
                        }
                    }
                    if(comedy == true){
                        if !genres.contains("35"){
                            genres.append("35")
                        }
                    } else {
                        if let index = genres.firstIndex(of: "35") {
                            genres.remove(at: index)
                        }
                    }
                    if(crime == true){
                        if !genres.contains("80"){
                            genres.append("80")
                        }
                    } else {
                        if let index = genres.firstIndex(of: "80") {
                            genres.remove(at: index)
                        }
                    }
                    if(documentary == true){
                        if !genres.contains("99"){
                            genres.append("99")
                        }
                    } else {
                        if let index = genres.firstIndex(of: "99") {
                            genres.remove(at: index)
                        }
                    }
                    if(drama == true){
                        if !genres.contains("18"){
                            genres.append("18")
                        }
                    } else {
                        if let index = genres.firstIndex(of: "18") {
                            genres.remove(at: index)
                        }
                    }
                    if(family == true){
                        if !genres.contains("10751"){
                            genres.append("10751")
                        }
                    } else {
                        if let index = genres.firstIndex(of: "10751") {
                            genres.remove(at: index)
                        }
                    }
                    if(fantasy == true){
                        if !genres.contains("14"){
                            genres.append("14")
                        }
                    } else {
                        if let index = genres.firstIndex(of: "14") {
                            genres.remove(at: index)
                        }
                    }
                    if(history == true){
                        if !genres.contains("36"){
                            genres.append("36")
                        }
                    } else {
                        if let index = genres.firstIndex(of: "36") {
                            genres.remove(at: index)
                        }
                    }
                    if(horror == true){
                        if !genres.contains("27"){
                            genres.append("27")
                        }
                    } else {
                        if let index = genres.firstIndex(of: "27") {
                            genres.remove(at: index)
                        }
                    }
                    if(music == true){
                        if !genres.contains("10402"){
                            genres.append("10402")
                        }
                    } else {
                        if let index = genres.firstIndex(of: "10402") {
                            genres.remove(at: index)
                        }
                    }
                    if(mystery == true){
                        if !genres.contains("9648"){
                            genres.append("9648")
                        }
                    } else {
                        if let index = genres.firstIndex(of: "9648") {
                            genres.remove(at: index)
                        }
                    }
                    if(romance == true){
                        if !genres.contains("10749"){
                            genres.append("10749")
                        }
                    } else {
                        if let index = genres.firstIndex(of: "10749") {
                            genres.remove(at: index)
                        }
                    }
                    if(scifi == true){
                        if !genres.contains("878"){
                            genres.append("878")
                        }
                    } else {
                        if let index = genres.firstIndex(of: "878") {
                            genres.remove(at: index)
                        }
                    }
                    if(thriller == true){
                        if !genres.contains("53"){
                            genres.append("53")
                        }
                    } else {
                        if let index = genres.firstIndex(of: "53") {
                            genres.remove(at: index)
                        }
                    }
                    if(war == true){
                        if !genres.contains("10752"){
                            genres.append("10752")
                        }
                    } else {
                        if let index = genres.firstIndex(of: "10752") {
                            genres.remove(at: index)
                        }
                    }
                    if(western == true){
                        if !genres.contains("37"){
                            genres.append("37")
                        }
                    } else {
                        if let index = genres.firstIndex(of: "37") {
                            genres.remove(at: index)
                        }
                    }
                    
                    if let movies = movieModel.remote.data?.results {
                        for i in likedMoviesList.indices {
                            if movies[counter].id == likedMoviesList[i] {
                                if counter == movies.count - 1 {
                                    counter = 0
                                }
                                counter += 1
                            }
                        }
                        
                        for i in dislikedMoviesList.indices {
                            if movies[counter].id == dislikedMoviesList[i] {
                                if counter == movies.count - 1 {
                                    counter = 0
                                }
                                counter += 1
                            }
                        }
                    }
                    
                    hasSavedFilter = true
                    
                } label: {
                    Text("Apply Changes")
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
