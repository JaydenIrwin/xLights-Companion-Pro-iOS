//
//  ACDCCalculator.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-02-05.
//

import SwiftUI

struct ACDCCalculator: View {
    var body: some View {
        Form {
            Section(header: Text("Components")) {
                HStack {
                    Label("Power Bar", systemImage: "power")
                    Spacer()
                    Text("20W")
                }
                HStack {
                    Label("4x Tree Lights", systemImage: "lightbulb")
                    Spacer()
                    Text("10W")
                }
                HStack {
                    Label("2x Snowflakes", systemImage: "lightbulb")
                    Spacer()
                    Text("5W")
                }
            }
            Section(header: Text("Result")) {
                Text("Overload - This combination will overload your system.")
            }
        }
        .listStyle(InsetGroupedListStyle())
        .frame(maxWidth: 512)
        .navigationTitle("AC/DC Calculator")
    }
}

struct ACDCCalculator_Previews: PreviewProvider {
    static var previews: some View {
        ACDCCalculator()
    }
}