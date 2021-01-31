//
//  SearchView.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-01-30.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationView {
            List {
                
            }
            .navigationTitle("Search")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .tabItem { Label("Search", systemImage: "magnifyingglass") }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
