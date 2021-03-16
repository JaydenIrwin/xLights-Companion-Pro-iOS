//
//  OutletObject.swift
//  xLights Companion Pro
//
//  Created by Nicholas Long on 2021-03-16.
//

import Foundation

struct PortItem : Identifiable {
    var id: UUID {
        UUID()
    }
    let name : String
    let pixels : Int
    let controller : String?
}
