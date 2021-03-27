//
//  Port.swift
//  xLights Companion Pro
//
//  Created by Nicholas Long on 2021-03-16.
//

import Foundation

class Port : Identifiable {
    let id : Int
    var elements : [PortObject]
    var pixels : Int {
        var totalPixels = 0;
        for element in elements{
            if let pixels = element.pixels {
                totalPixels += pixels
            }
        }
        return totalPixels
    }
    
    init(id: Int, elements: [PortObject]) {
        self.id = id
        self.elements = elements
    }
}
