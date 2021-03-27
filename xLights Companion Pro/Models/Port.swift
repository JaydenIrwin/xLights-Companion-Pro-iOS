//
//  Port.swift
//  xLights Companion Pro
//
//  Created by Nicholas Long on 2021-03-16.
//

import Foundation

struct Port : Identifiable, Codable, RawRepresentable {
    
    var id : Int
    var objects : [PortObject]
    var pixels : Int {
        var totalPixels = 0;
        for object in objects {
            if let pixels = object.pixels {
                totalPixels += pixels
            }
        }
        return totalPixels
    }
    
    init(id: Int, objects: [PortObject]) {
        self.id = id
        self.objects = objects
    }
    
    init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8), let result = try? JSONDecoder().decode(Self.self, from: data) else {
            return nil
        }
        self = result
    }

    var rawValue: String {
        guard let data = try? JSONEncoder().encode(self), let result = String(data: data, encoding: .utf8) else {
            return "[]"
        }
        return result
    }
}

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
