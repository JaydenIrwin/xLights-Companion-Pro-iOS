//
//  OutletObject.swift
//  xLights Companion Pro
//
//  Created by Nicholas Long on 2021-03-16.
//

import Foundation

// THIS IS THE PIXEL REPRESENTATION FOR PROP ORGANIZER, NOT FOR AR.

struct OrganizerProp : Identifiable, Codable {
    let uuid = UUID()
    var name : String
    var pixels : Int
    var id: String { // Long id string to update view when any value changes
        "\(uuid)-\(name)-\(pixels)"
    }
}
