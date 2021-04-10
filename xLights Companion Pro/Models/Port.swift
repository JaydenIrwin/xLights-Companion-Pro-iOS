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
    
}
