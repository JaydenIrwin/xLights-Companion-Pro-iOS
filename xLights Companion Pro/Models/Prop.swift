//
//  Prop.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-03-12.
//

import Foundation

struct Prop: Identifiable {
    
    let iconName: String
    let fileName: String
    var id: String {
        fileName
    }
    
    static let allProps = [
        Prop(iconName: "Tree", fileName: "Tree"),
        Prop(iconName: "Star", fileName: "Star"),
        Prop(iconName: "Cane", fileName: "Cane"),
        Prop(iconName: "Grid", fileName: "Grid"),
        Prop(iconName: "Rainbow", fileName: "Rainbow")
    ]
    
}
