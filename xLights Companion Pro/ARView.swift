//
//  ARView.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-02-23.
//

import SwiftUI
import ARKit

struct ARView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        let view = ARSCNView()
        view.session.run(ARWorldTrackingConfiguration(), options: [])
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //
    }
    
}

struct ARView_Previews: PreviewProvider {
    static var previews: some View {
        ARView()
    }
}
