//
//  Prop.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-03-12.
//

import RealityKit

// THIS IS THE 3D MODEL REPRESENTATION FOR AR, NOT FOR PROP ORGANIZER.

struct PropModel: Equatable, Identifiable {
    
    let iconName: String
    let fileName: String
    let plane: AnchoringComponent.Target.Alignment
    var id: String {
        fileName
    }
    
    static let allProps = [
        PropModel(iconName: "Arch", fileName: "Arch", plane: .horizontal),
        PropModel(iconName: "Candy Cane", fileName: "Candy Cane", plane: .horizontal),
        PropModel(iconName: "Circle Border", fileName: "Circle Border", plane: .any),
        PropModel(iconName: "Matrix", fileName: "Matrix", plane: .any),
        PropModel(iconName: "Mega Tree", fileName: "Mega Tree", plane: .horizontal),
        PropModel(iconName: "Mini Tree", fileName: "Mini Tree", plane: .horizontal),
        PropModel(iconName: "Pipe", fileName: "Pipe", plane: .any),
        PropModel(iconName: "Present", fileName: "Present", plane: .horizontal),
        PropModel(iconName: "Snow Flake", fileName: "Snow Flake", plane: .any),
        PropModel(iconName: "Sphere", fileName: "Sphere", plane: .horizontal),
        PropModel(iconName: "Spiral Tree", fileName: "Spiral Tree", plane: .horizontal),
        PropModel(iconName: "Square Border", fileName: "Square Border", plane: .any),
        PropModel(iconName: "Star", fileName: "Star", plane: .any)
    ]
    
}
