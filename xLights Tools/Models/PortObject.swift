//
//  OutletObject.swift
//  xLights Companion Pro
//
//  Created by Nicholas Long on 2021-03-16.
//

import Foundation

struct PortObject : Identifiable, Codable {
    let id = UUID()
    var name : String
    var pixels : Int
}
