//
//  WebViewContainer.swift
//  WhatToWatch
//
//  Created by Jakoob Ishak on 2021-12-09.
//

// Code inspiration provided by https://blog.devgenius.io/webviews-in-swiftui-d5b1229e37ba

import Foundation
import SwiftUI
import WebKit

struct WebViewContainer: UIViewRepresentable {
    @ObservedObject var webViewModel: WebViewModel
    
    func makeCoordinator() -> WebViewContainer.Coordinator {
        Coordinator(self, webViewModel)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.webViewModel.url) else {
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.load(request)
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if webViewModel.shouldGoBack {
            uiView.goBack()
            webViewModel.shouldGoBack = false
        }
    }
}
