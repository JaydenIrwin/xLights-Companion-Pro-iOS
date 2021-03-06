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
                    NavigationLink(destination: TreeLightsCalculator()) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Label("Tree Lights Calculator", systemImage: "leaf.fill")
                                    .font(.title2)
                                    .foregroundColor(Color(UIColor.systemGreen))
                                Text("How many lights will my tree need?")
                                    .foregroundColor(Color(UIColor.secondaryLabel))
                            }
                            Spacer()
                        }
                        .padding(.vertical, 4)
                    }
                }
                .frame(minHeight: 130)
                Section {
                    NavigationLink(destination: PowerCalculator()) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Label("Power Calculator", systemImage: "bolt.fill")
                                    .font(.title2)
                                    .foregroundColor(Color(UIColor.systemYellow))
                                Text("Determine the power consumption of your setup.")
                                    .foregroundColor(Color(UIColor.secondaryLabel))
                            }
                            Spacer()
                        }
                        .padding(.vertical, 4)
                    }
                }
                .frame(minHeight: 130)
                Section {
                    NavigationLink(destination: PropOrganizer()) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Label("Prop Organizer", systemImage: "power")
                                    .font(.title2)
                                    .foregroundColor(Color(UIColor.systemBlue))
                                Text("Keep track of which props are plugged into which outlets.")
                                    .foregroundColor(Color(UIColor.secondaryLabel))
                            }
                            Spacer()
                        }
                        .padding(.vertical, 4)
                    }
                }
                .frame(minHeight: 130)
                
//                Section {
//                    NavigationLink(destination: ConsumptionCalculator()) {
//                        HStack {
//                            VStack(alignment: .leading, spacing: 4) {
//                                Label("Consumption Calculator", systemImage: "dollarsign.circle.fill")
//                                    .font(.title2)
//                                    .foregroundColor(Color(UIColor.systemRed))
//                                Text("Determine the cost to run your display.")
//                                    .foregroundColor(Color(UIColor.secondaryLabel))
//                            }
//                            Spacer()
//                        }
//                        .padding(.vertical, 4)
//                    }
//                }
                
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Tools")
        }
        .tabItem { Label("Tools", systemImage: "hammer.fill") }
    }
}

struct ToolsView_Previews: PreviewProvider {
    static var previews: some View {
        ToolsView()
    }
}
