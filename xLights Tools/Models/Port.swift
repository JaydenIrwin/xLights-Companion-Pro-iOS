//
//  Port.swift
//  xLights Companion Pro
//
//  Created by Nicholas Long on 2021-03-16.
//

import Foundation

struct Port : Identifiable, Codable {
    
    var number : Int
    var props : [OrganizerProp]
    var pixels : Int {
        props.map({ $0.pixels }).reduce(0, +)
    }
    var id: String { // Long id string to update view when any value changes
        "\(number)-\(pixels)"
    }
    
    init(number: Int, props: [OrganizerProp]) {
        self.number = number
        self.props = props
    }
    
}
