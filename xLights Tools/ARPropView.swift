//
//  ARPropView.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-02-23.
//

import SwiftUI

struct ARPropView: View {
    
    @State var showingPropPicker = false
    @State var selectedProp: PropModel?
    @State var arIsPaused = true
    
    var body: some View {
        MyARView(selectedProp: $selectedProp, isPaused: $arIsPaused)
            .ignoresSafeArea()
            .overlay(Button(action: {
                showingPropPicker = true
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .imageScale(.large)
                    .font(.title)
                    .foregroundColor(.white)
            }).padding(), alignment: .bottom)
            .sheet(isPresented: $showingPropPicker) {
                ARPropsBrowser(selectedProp: $selectedProp)
            }
            .onAppear() {
                arIsPaused = false
            }
            .onDisappear() {
                arIsPaused = true
            }
            .tabItem { Label("AR Props", systemImage: "arkit") }
    }
}


