//
//  WebViewModel.swift
//  WhatToWatch
//
//  Created by Jakoob Ishak on 2021-12-09.
//

// Code inspiration provided by https://blog.devgenius.io/webviews-in-swiftui-d5b1229e37ba

import Foundation

class WebViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var canGoBack: Bool = false
    @Published var shouldGoBack: Bool = false
    @Published var title: String = ""
    
    var url: String
    
    init(url: String) {
        self.url = url
    }
}
