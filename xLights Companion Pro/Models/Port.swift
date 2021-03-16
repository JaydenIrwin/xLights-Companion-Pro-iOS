//
//  Port.swift
//  xLights Companion Pro
//
//  Created by Nicholas Long on 2021-03-16.
//

import SwiftUI

struct Port : Identifiable {
    let id : Int
    var elements : [PortItem]
    var pixels : Int {
        var totalPixels = 0;
        for element in elements{
            totalPixels += element.pixels
        }
        return totalPixels
    }
    
}
