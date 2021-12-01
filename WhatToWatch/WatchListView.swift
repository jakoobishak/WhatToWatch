//
//  WatchListView.swift
//  WhatToWatch
//
//  Created by Kyrollos Ceriacous on 2021-11-28.
//

import SwiftUI

struct WatchListView: View {
    var body: some View {
        VStack(spacing: 0){
            List{
                ForEach(0..<9){ index in
                    NavigationLink{
                        AdditionalInfoView()
                    } label: {
                        Text("Movie in watch list \(index)")
                    }
                }
            }
        }
        
    }
}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListView()
    }
}