//
//  TreeLightsCalculator.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-02-03.
//

import SwiftUI

struct TreeLightsCalculator: View {
    var body: some View {
        Form {
            Section(header: Text("Tree")) {
                HStack {
                    Text("Type")
                    Spacer()
                    Text("Pine")
                }
                HStack {
                    Text("Height")
                    Spacer()
                    Text("15m")
                }
                HStack {
                    Text("Diameter")
                    Spacer()
                    Text("2m")
                }
                HStack {
                    Text("Light Spacing")
                    Spacer()
                    Text("Normal")
                }
            }
            Section(header: Text("Result")) {
                Text("This tree will use about 50 meters of lights.")
            }
        }
        .listStyle(InsetGroupedListStyle())
        .frame(maxWidth: 512)
        .navigationTitle("Tree Lights Calculator")
    }
}

struct TreeLightsCalculator_Previews: PreviewProvider {
    static var previews: some View {
        TreeLightsCalculator()
    }
}
