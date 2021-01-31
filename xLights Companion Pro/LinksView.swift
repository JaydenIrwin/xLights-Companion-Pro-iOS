//
//  LinksView.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-01-30.
//

import SwiftUI

struct LinksView: View {
    var body: some View {
        NavigationView {
            List {
                
            }
            .navigationTitle("Links")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .tabItem { Label("Links", systemImage: "link") }
    }
}

struct LinksView_Previews: PreviewProvider {
    static var previews: some View {
        LinksView()
    }
}
