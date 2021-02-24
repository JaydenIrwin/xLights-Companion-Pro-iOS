//
//  ARPropView.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-02-23.
//

import SwiftUI

struct ARPropView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ARView()
            .overlay(Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark.circle.fill")
            }).padding(), alignment: .topLeading)
    }
}

struct ARPropView_Previews: PreviewProvider {
    static var previews: some View {
        ARPropView()
    }
}
