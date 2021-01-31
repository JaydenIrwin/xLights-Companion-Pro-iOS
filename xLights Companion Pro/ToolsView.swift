//
//  ToolsView.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-01-30.
//

import SwiftUI

struct ToolsView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Getting Started".uppercased())
                        .font(.headline)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                    Text("Preview Props In AR")
                        .font(.title)
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(8)
                .padding()
            }
            .frame(idealWidth: 512, maxWidth: .infinity)
            .navigationTitle("Tools")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .tabItem { Label("Tools", systemImage: "hammer.fill") }
    }
}

struct ToolsView_Previews: PreviewProvider {
    static var previews: some View {
        ToolsView()
    }
}
