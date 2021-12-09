//
//  TrailerView.swift
//  WhatToWatch
//
//  Created by Kyrollos Ceriacous on 2021-12-09.
//

import SwiftUI

struct TrailerView: View {
    
    @ObservedObject var webViewModel = WebViewModel(url: "https://www.youtube.com/embed/1x0GpEZnwa8")

    var body: some View {
        
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

struct TrailerView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerView()
    }
}
