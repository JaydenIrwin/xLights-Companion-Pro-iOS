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
        Prop(iconName: "Arch", fileName: "Arch"),
        Prop(iconName: "Candy Cane", fileName: "Candy Cane"),
        Prop(iconName: "Star", fileName: "Circle Border"),
        Prop(iconName: "Matrix", fileName: "Matrix"),
        Prop(iconName: "Star", fileName: "Mega Tree"),
        Prop(iconName: "Star", fileName: "Mini Tree"),
        Prop(iconName: "Star", fileName: "Pipe"),
        Prop(iconName: "Star", fileName: "Present"),
        Prop(iconName: "Star", fileName: "Snow Flake"),
        Prop(iconName: "Star", fileName: "Sphere"),
        Prop(iconName: "Spiral Tree", fileName: "Spiral Tree"),
        Prop(iconName: "Star", fileName: "Square Border"),
        Prop(iconName: "Star", fileName: "Star")
    ]
    
}
