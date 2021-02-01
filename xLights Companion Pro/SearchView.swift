//
//  SearchView.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-01-30.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchString = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                TextField("Search", text: $searchString)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Spacer()
                Text("Suggestions")
                    .font(.headline)
                Button("Snowflake Light", action: { })
                    .foregroundColor(Color.accentColor)
                Button("Calculate Power", action: { })
                    .foregroundColor(Color.accentColor)
                Button("Jingle Bells", action: { })
                    .foregroundColor(Color.accentColor)
                Button("Discord", action: { })
                    .foregroundColor(Color.accentColor)
                Button("Videos", action: { })
                    .foregroundColor(Color.accentColor)
                Spacer()
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
