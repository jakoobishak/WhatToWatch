//
//  TrashListView.swift
//  WhatToWatch
//
//  Created by Kyrollos Ceriacous on 2021-11-28.
//

import SwiftUI

struct TrashListView: View {
    var body: some View {
        VStack(spacing: 0){
            List {
                Section(header: Text("I don't want to watch these!")){
                    ForEach(0..<5){ index in
                        NavigationLink{
                            AdditionalInfoView()
                        } label: {
                            Text("Trash movie \(index)")
                        }
                    }
                }
                
                Section(header: Text("Already watched...")){
                    ForEach(0..<5){ index in
                        NavigationLink{
                            AdditionalInfoView()
                        } label: {
                            Text("Already watched movie \(index)")
                        }
                    }
                }
            }
        }
    }
}

struct TrashListView_Previews: PreviewProvider {
    static var previews: some View {
        TrashListView()
    }
}
