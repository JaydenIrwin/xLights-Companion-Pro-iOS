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
            List {
                Section {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Label("Power Calculator", systemImage: "bolt.fill")
                                .font(.title)
                                .foregroundColor(Color(UIColor.systemYellow))
                            Text("Determine which props will work on which curcuits.")
                                .foregroundColor(Color(UIColor.secondaryLabel))
                        }
                        Spacer()
                    }
                    .padding()
                }
                Section {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Label("Outlet Organizer", systemImage: "power")
                                .font(.title)
                                .foregroundColor(Color(UIColor.systemBlue))
                            Text("Keep track of which props are plugged into which outlets.")
                                .foregroundColor(Color(UIColor.secondaryLabel))
                        }
                        Spacer()
                    }
                    .padding()
                }
                Section {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Label("Tree Lights Calculator", systemImage: "leaf.fill")
                                .font(.title)
                                .foregroundColor(Color(UIColor.systemGreen))
                            Text("How many lights will my tree need?")
                                .foregroundColor(Color(UIColor.secondaryLabel))
                        }
                        Spacer()
                    }
                    .padding()
                }
            }
            .listStyle(InsetGroupedListStyle())
            .frame(maxWidth: 512)
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
