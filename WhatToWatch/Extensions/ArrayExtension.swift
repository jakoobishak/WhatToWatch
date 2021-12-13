//
//  ArrayExtension.swift
//  WhatToWatch
//
//  Created by Jakoob Ishak on 2021-12-03.
//

import Foundation

import Foundation

//used code from https://newbedev.com/swiftui-what-is-appstorage-property-wrapper
extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}


//used code from https://stackoverflow.com/questions/59872397/swiftui-reload-view
extension Array where Element: Equatable {

   mutating func remove(object: Element) {
       guard let index = firstIndex(of: object) else {return}
       remove(at: index)
   }

}
