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
    var name : String?
    var pixels : Int?
    var controller : String?
}
