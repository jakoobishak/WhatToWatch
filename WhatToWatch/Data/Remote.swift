//
//  Remote.swift
//  WhatToWatch
//
//  Created by Jakoob Ishak on 2021-11-27.
//

import Foundation
import Combine
import SwiftUI

class Remote<ResultData>: ObservableObject {
    private var cancellableTask: AnyCancellable?
    
    let url: URL
    let decode: (Data) throws -> ResultData
    
    @Published var isLoading = false
    @Published var data: ResultData?
    
    init(url: URL, decode: @escaping (Data) throws -> ResultData) {
        self.url = url
        self.decode = decode
    }
    
    func fetch() {
        isLoading = true
        
        cancellableTask = URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .tryMap(decode)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
            }, receiveValue: { [weak self] data in
                self?.data = data
            })
    }
    
}

extension Remote where ResultData: Decodable {
    convenience init(url: URL) {
        self.init(url: url) { data in
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            return try jsonDecoder.decode(ResultData.self, from: data)
        }
    }
}
