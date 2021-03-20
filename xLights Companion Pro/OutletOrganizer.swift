//
//  OutletOrganizer.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-02-03.
//

import SwiftUI

struct OutletOrganizer: View {
    
    @State var ports = [
        Port(id: 1, elements: [PortItem(name: "hi", pixels: 100, controller: "ME")]),
        Port(id: 2, elements: [PortItem(name: "hi", pixels: 100, controller: "ME")]),
        Port(id: 3, elements: [PortItem(name: "hi", pixels: 100, controller: "ME")]),
        Port(id: 4, elements: [PortItem(name: "hi", pixels: 100, controller: "ME")]),
        Port(id: 5, elements: [PortItem(name: "hi", pixels: 100, controller: "ME")])
    ]
    @State var showingPortItem = false
    @State var selectedIndex: (Int, Int)?
    
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
                        ForEach(Array(port.elements.enumerated()), id: \.offset) { index, element in
                            VStack(alignment: .leading) {
                                Text("Item \(element.name ?? "Item")")
                                Text("\(element.pixels ?? 0) pixels")
                                    .foregroundColor(Color(UIColor.secondaryLabel))
                            }
                            .padding()
                            .background(Color(UIColor.secondarySystemGroupedBackground))
                            .cornerRadius(16)
                            .onTapGesture {
                                selectedIndex = (port.id-1, index)
                                showingPortItem = true
                            }
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
                let newItem = PortItem(name: nil, pixels: nil, controller: nil)
                let portIndex = ports.endIndex - 1
                let elementIndex = ports[portIndex].elements.endIndex
                ports[portIndex].elements.append(newItem)
                selectedIndex = (portIndex, elementIndex)
                showingPortItem = true
            }, label: {
                Image(systemName: "plus.circle.fill")
            })
        })
        .sheet(isPresented: $showingPortItem) {
            PortItemView(portItem: $ports[selectedIndex!.0].elements[selectedIndex!.1])
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
