//
//  OutletOrganizer.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-02-03.
//

import SwiftUI

struct OutletOrganizer: View {
    
    @State var ports: [Port] = {
        OutletOrganizer.load()
    }()
    @State var showingPortItem = false
    @State var selectedIndex: (Int, Int)?
    @State var deleteAlert = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(ports) { (port) in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Port \(port.id)")
                            Text("\(port.pixels) pixels")
                                .foregroundColor(Color(UIColor.secondaryLabel))
                        }
                        .padding()
                        .background(Color(UIColor.secondarySystemGroupedBackground))
                        .cornerRadius(16)
                        .contextMenu {
                            Button {
                                ports.remove(at: port.id-1)
                                // Recalculate port ids after removal
                                for (pIndex) in ports.indices {
                                    ports[pIndex].id = pIndex + 1
                                }
                                save()
                            } label : {
                                Label("Remove", systemImage: "trash")
                            }
                        }
                        
                        ForEach(Array(port.objects.enumerated()), id: \.offset) { index, object in
                            VStack(alignment: .leading) {
                                Text("\(object.name ?? "Item")")
                                Text("\(object.pixels ?? 0) pixels")
                                    .foregroundColor(Color(UIColor.secondaryLabel))
                            }
                            .padding()
                            .background(Color(UIColor.secondarySystemGroupedBackground))
                            .cornerRadius(16)
                            .onTapGesture {
                                selectedIndex = (port.id-1, index)
                                showingPortItem = true
                            }
                            .contextMenu {
                                Menu {
                                    ForEach(ports) { newPort in
                                        Button(action: {
                                            ports[port.id-1].objects.remove(at: index)
                                            ports[newPort.id-1].objects.append(object)
                                        }, label: {
                                            Label("Port \(newPort.id)", systemImage: "power")
                                        })
                                    }
                                } label: {
                                    Label("Move to...", systemImage: "arrow.turn.down.right")
                                }
                                Button {
                                    ports[port.id-1].objects.remove(at: index)
                                    save()
                                } label : {
                                    Label("Remove", systemImage: "trash")
                                }
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
            ToolbarItem(placement: .navigationBarTrailing){
                Menu {
                    Button(action: {
                        ports.append(Port(id: ports.endIndex+1, objects: []))
                        save()
                    }, label: {
                        Label("Add Port", systemImage: "power")
                    })
                    Button(action: {
                        // Show New Object
                        let newItem = PortObject(name: nil, pixels: nil)
                        let portIndex = ports.endIndex - 1
                        let elementIndex = ports[portIndex].objects.endIndex
                        ports[portIndex].objects.append(newItem)
                        selectedIndex = (portIndex, elementIndex)
                        showingPortItem = true
                        save()
                    }, label: {
                        Label("Add Object", systemImage: "cube")
                    })
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {
                    deleteAlert = true
                }, label: {
                    Image(systemName: "trash")
                })
            }
        })
        .alert(isPresented: $deleteAlert) {
            Alert(title: Text("Delete Data?"),
                  message: Text("This will clear all outlet data."),
                  primaryButton: .destructive(Text("Delete")) {
                    ports = [
                        Port(id: 1, objects: [PortObject(name: "Mega Tree", pixels: 1000)]),
                        Port(id: 2, objects: []),
                        Port(id: 3, objects: []),
                        Port(id: 4, objects: [])
                    ]
                    save()
                  },
                  secondaryButton: .cancel())
        }
        .sheet(isPresented: $showingPortItem) {
            PortObjectView(portObject: $ports[selectedIndex!.0].objects[selectedIndex!.1])
        }
        .onAppear() {
            ports = OutletOrganizer.load()
        }
        .onChange(of: showingPortItem) { newValue in
            save()
        }
    }
    
    static func load() -> [Port] {
        guard let fileURL  = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Outlet Org Ports").appendingPathExtension("json") else {return [
            Port(id: 1, objects: [PortObject(name: "Mega Tree", pixels: 1000)]),
            Port(id: 2, objects: []),
            Port(id: 3, objects: []),
            Port(id: 4, objects: [])
        ]}
        do {
            let data = try Data(contentsOf: fileURL)
            return try JSONDecoder().decode([Port].self, from: data)
        } catch {
            print("Unable to decode")
            return [
                Port(id: 1, objects: [PortObject(name: "Mega Tree", pixels: 1000)]),
                Port(id: 2, objects: []),
                Port(id: 3, objects: []),
                Port(id: 4, objects: [])
            ]
        }
    }
    
    func save() {
        guard let fileURL  = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Outlet Org Ports").appendingPathExtension("json") else {return}
        do {
            let data = try JSONEncoder().encode(ports)
            try data.write(to: fileURL)
        } catch {
            print("Failed to save ports")
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
