//
//  ARMainView.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-01-30.
//

import SwiftUI

struct ARPropsView: View {
    var body: some View {
        NavigationView {
            ZStack {
                
            }
            .navigationTitle("AR Props")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .tabItem { Label("AR Props", systemImage: "arkit") }
    }
}

struct ARMainView_Previews: PreviewProvider {
    static var previews: some View {
        ARPropsView()
    }
}
