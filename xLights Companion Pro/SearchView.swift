//
//  SearchView.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-01-30.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchString = ""
    
    var results: [RelatedWebsite] {
        RelatedWebsite.websites.filter({ $0.name.lowercased().contains(searchString.lowercased()) })
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                TextField("Search", text: $searchString)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    , alignment: .leading)
                    .padding(.horizontal, 10)
                if searchString == "" {
                    Spacer()
                    Text("Suggestions")
                        .font(.headline)
                    Button("Snowflake Light", action: { })
                        .foregroundColor(Color.accentColor)
                    Button("Calculate Power", action: { })
                        .foregroundColor(Color.accentColor)
                    Button("Jingle Bells", action: { })
                        .foregroundColor(Color.accentColor)
                    Button("Zoom", action: { })
                        .foregroundColor(Color.accentColor)
                    Button("Videos", action: { })
                        .foregroundColor(Color.accentColor)
                    Spacer()
                } else {
                    List {
                        ForEach(results) { result in
                            Button(result.name) {
                                //
                            }
                        }
                    }
                }
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
