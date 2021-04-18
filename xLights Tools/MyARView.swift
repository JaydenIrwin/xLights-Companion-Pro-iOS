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
    @Binding var isPaused: Bool

    func makeUIView(context: Context) -> ARView {
        #if targetEnvironment(simulator)
        let uiView = ARView()
        #else
        let uiView = ARView(frame: .zero, cameraMode: ARView.CameraMode.ar, automaticallyConfigureSession: false)
        uiView.session.pause()
        uiView.enableObjectRemoval()
        #endif
        return uiView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        #if !targetEnvironment(simulator)
        if isPaused {
            uiView.session.pause()
        } else {
            let config = ARWorldTrackingConfiguration()
            config.planeDetection = [.horizontal, .vertical]
            uiView.session.run(config, options: [])
        }
        if let prop = selectedProp {
            do {
                let model = try Entity.loadModel(named: prop.fileName)
                let anchor = AnchorEntity(plane: prop.plane)
                anchor.name = "My Anchor"
                anchor.addChild(model)
                uiView.scene.addAnchor(anchor)
                
                model.generateCollisionShapes(recursive: true)
                uiView.installGestures([.translation, .rotation, .scale], for: model)
            } catch {
                print("Failed to load prop model.")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { // Delay so selected prop will stay highlighted in UI for 0.1 sec after tap
                selectedProp = nil
            }
        }
        #endif
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
