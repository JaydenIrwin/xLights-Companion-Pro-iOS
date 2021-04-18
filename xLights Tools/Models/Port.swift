//
//  Port.swift
//  xLights Companion Pro
//
//  Created by Nicholas Long on 2021-03-16.
//

import Foundation

struct Port : Identifiable, Codable {
    
    var number : Int
    var objects : [PortObject]
    var pixels : Int {
        objects.map({ $0.pixels }).reduce(0, +)
    }
    var id: String {
        "\(number)-\(pixels)"
    }
    
    init(number: Int, objects: [PortObject]) {
        self.number = number
        self.objects = objects
    }
    
}
