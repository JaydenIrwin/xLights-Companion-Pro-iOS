//
//  ARView.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-02-23.
//

import SwiftUI
import ARKit
import RealityKit

struct MyARView: UIViewRepresentable {
    
    @Binding var selectedProp: Prop?

    func makeUIView(context: Context) -> ARView {
        #if targetEnvironment(simulator)
        let uiView = ARView()
        #else
        let uiView = ARView(frame: .zero, cameraMode: ARView.CameraMode.ar, automaticallyConfigureSession: true)
        uiView.enableObjectRemoval()
        #endif
        return uiView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        #if !targetEnvironment(simulator)
        let mesh = MeshResource.generateBox(size: 0.5)
        let material = SimpleMaterial(color: .blue, isMetallic: false)
        let model = ModelEntity(mesh: mesh, materials: [material])
        let anchor = AnchorEntity(plane: .any)
        anchor.name = "My Anchor"
        anchor.addChild(model)
        uiView.scene.addAnchor(anchor)
        
        model.generateCollisionShapes(recursive: true)
        uiView.installGestures([.translation, .rotation, .scale], for: model)
        #endif
        
        selectedProp = nil
    }
    
}

extension ARView {
    func enableObjectRemoval() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        addGestureRecognizer(longPress)
    }
    
    @objc func handleLongPress(recognizer: UILongPressGestureRecognizer) {
        let loc = recognizer.location(in: self)
        if let entity = entity(at: loc) {
            if let anchor = entity.anchor, anchor.name == "My Anchor" {
                anchor.removeFromParent()
            }
        }
    }
}
