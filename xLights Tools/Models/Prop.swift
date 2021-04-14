//
//  Prop.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-03-12.
//

import RealityKit

struct Prop: Identifiable {
    
    let iconName: String
    let fileName: String
    let plane: AnchoringComponent.Target.Alignment
    var id: String {
        fileName
    }
    
    static let allProps = [
        Prop(iconName: "Arch", fileName: "Arch", plane: .horizontal),
        Prop(iconName: "Candy Cane", fileName: "Candy Cane", plane: .horizontal),
        Prop(iconName: "Star", fileName: "Circle Border", plane: .any),
        Prop(iconName: "Matrix", fileName: "Matrix", plane: .any),
        Prop(iconName: "Star", fileName: "Mega Tree", plane: .horizontal),
        Prop(iconName: "Star", fileName: "Mini Tree", plane: .horizontal),
        Prop(iconName: "Star", fileName: "Pipe", plane: .any),
        Prop(iconName: "Star", fileName: "Present", plane: .horizontal),
        Prop(iconName: "Star", fileName: "Snow Flake", plane: .any),
        Prop(iconName: "Star", fileName: "Sphere", plane: .horizontal),
        Prop(iconName: "Spiral Tree", fileName: "Spiral Tree", plane: .horizontal),
        Prop(iconName: "Star", fileName: "Square Border", plane: .any),
        Prop(iconName: "Star", fileName: "Star", plane: .any)
    ]
    
}
