//
//  PowerCalculator.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-02-03.
//

import SwiftUI

struct ConsumptionCalculator: View {
    var body: some View {
        Form {
            Section(header: Text("Components")) {
                HStack {
                    Label("Total Electricity", systemImage: "power")
                    Spacer()
                    Text("200W")
                }
                HStack {
                    Label("Time Running Per Day", systemImage: "clock")
                    Spacer()
                    Text("5h")
                }
                HStack {
                    Label("Local Electricity Rate", systemImage: "dollarsign.circle")
                    Spacer()
                    Text("$0.05/KWh")
                }
            }
            Section(header: Text("Cost")) {
                Text("This setup will cost you $6.37 a night, or $125.52 for the season.")
            }
        }
        .listStyle(InsetGroupedListStyle())
        .frame(maxWidth: 512)
        .navigationTitle("Consumption Calculator")
    }
}

struct PowerCalculator_Previews: PreviewProvider {
    static var previews: some View {
        ConsumptionCalculator()
    }
}
