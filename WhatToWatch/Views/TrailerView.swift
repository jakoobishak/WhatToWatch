//
//  TrailerView.swift
//  WhatToWatch
//
//  Created by Kyrollos Ceriacous on 2021-12-09.
//

import SwiftUI

struct TrailerView: View {
    var trailer : MovieTrailer
    
    @ObservedObject var webViewModel : WebViewModel
    
    var body: some View {
        VStack(spacing: 0) {
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
    
}

