//
//  Port.swift
//  xLights Companion Pro
//
//  Created by Nicholas Long on 2021-03-16.
//

import Foundation

struct Port : Identifiable, Codable {
    
    var id : Int
    var objects : [PortObject]
    var pixels : Int {
        objects.map({ $0.pixels }).reduce(0, +)
    }
    
    init(id: Int, objects: [PortObject]) {
        self.id = id
        self.objects = objects
    }
    
}
