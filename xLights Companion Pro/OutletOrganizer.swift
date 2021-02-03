//
//  OutletOrganizer.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-02-03.
//

import SwiftUI

struct OutletOrganizer: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(0..<10) { (index) in
                    HStack {
                        ForEach(0..<Int.random(in: 1...3)) { index2 in
                            VStack(alignment: .leading) {
                                Text(index2 == 0 ? "Outlet \(index+1)" : "Item \(index2)")
                                Text("Item details")
                                    .foregroundColor(Color(UIColor.secondaryLabel))
                            }
                            .padding()
                            .background(Color(UIColor.secondarySystemGroupedBackground))
                            .cornerRadius(16)
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Outlet Organizer")
    }
}

struct OutletOrganizer_Previews: PreviewProvider {
    static var previews: some View {
        OutletOrganizer()
    }
}
