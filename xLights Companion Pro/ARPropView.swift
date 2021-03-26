//
//  ARPropView.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-02-23.
//

import SwiftUI

struct ARPropView: View {
    
    @State var showingPropPicker = false
    @State var selectedProp: Prop?
    
    var body: some View {
        MyARView(selectedProp: $selectedProp)
            .overlay(Button(action: {
                showingPropPicker = true
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .imageScale(.large)
                    .font(.title)
                    .foregroundColor(.white)
            }).padding(), alignment: .bottom)
            .sheet(isPresented: $showingPropPicker) {
                ARPropsView(selectedProp: $selectedProp)
            }
            .tabItem { Label("AR Props", systemImage: "arkit") }
    }
}

struct ARPropView_Previews: PreviewProvider {
    static var previews: some View {
        ARPropView()
    }
}
