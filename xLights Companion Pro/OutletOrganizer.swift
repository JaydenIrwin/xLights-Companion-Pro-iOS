//
//  OutletOrganizer.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-02-03.
//

import SwiftUI

struct OutletOrganizer: View {
    
    @State var ports = Array(repeating: Port(id: 0, elements: [PortItem(name: "hi", pixels: 100, controller: "ME")]), count: 5)
    @State var showingPortItem: PortItem?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(ports) { (port) in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Port \(port.id)")
                            Text("Item details")
                                .foregroundColor(Color(UIColor.secondaryLabel))
                        }
                        .padding()
                        .background(Color(UIColor.secondarySystemGroupedBackground))
                        .cornerRadius(16)
                        ForEach(port.elements) { element in
                            VStack(alignment: .leading) {
                                Text("Item \(element.name)")
                                Text("\(element.pixels) pixels")
                                    .foregroundColor(Color(UIColor.secondaryLabel))
                            }
                            .padding()
                            .background(Color(UIColor.secondarySystemGroupedBackground))
                            .cornerRadius(16)
                        }
                        Spacer()
                    }
                }
            }
            .padding()
        }
        .frame(idealWidth: .infinity, maxWidth: .infinity)
        .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
        .navigationTitle("Outlet Organizer")
        .toolbar(content: {
            Button(action: {
                let newItem = PortItem(name: "", pixels: 0, controller: nil)
                ports[ports.endIndex - 1].elements.append(newItem)
                showingPortItem = newItem
            }, label: {
                Image(systemName: "plus.circle.fill")
            })
        })
        .sheet(item: $showingPortItem) { (portItem) in
            PortItemView(portItem: Binding(get: {
                portItem
            }, set: { (newValue) in
                showingPortItem = newValue
            }))
        }
    }
}

struct OutletOrganizer_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OutletOrganizer()
        }
    }
}
