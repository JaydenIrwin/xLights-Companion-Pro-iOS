//
//  OutletOrganizer.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-02-03.
//

import SwiftUI

struct OutletOrganizer: View {
    
    @ObservedObject var data = OutletDataSource()
    
    @State var showingPortObject: PortObject?
    @State var deleteAlert = false
    
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(data.ports) { (port) in
                    Section {
                        PortObjectCell(title: "Port \(port.number)", description: "\(port.pixels) px")
                        .contextMenu {
                            Button {
                                data.removePort(port)
                            } label : {
                                Label("Remove", systemImage: "trash")
                            }
                        }
                        
                        ForEach(Array(port.objects.enumerated()), id: \.1.id) { index, object in
                            PortObjectCell(title: object.name, description: "\(object.pixels) px")
                            .onTapGesture {
                                showingPortObject = object
                            }
                            .contextMenu {
                                Menu {
                                    ForEach(data.ports) { newPort in
                                        Button(action: {
                                            data.movePortObject(object, to: newPort)
                                        }, label: {
                                            Label("Port \(newPort.number)", systemImage: "power")
                                        })
                                    }
                                } label: {
                                    Label("Move to...", systemImage: "arrow.turn.down.right")
                                }
                                Button {
                                    data.removePortObject(object)
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
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button(action: {
                        data.addNewPort()
                    }, label: {
                        Label("Add Port", systemImage: "power")
                    })
                    Button(action: {
                        showingPortObject = data.addNewPortObject()
                    }, label: {
                        Label("Add Object", systemImage: "cube")
                    })
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
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
                    data.deleteAll()
                  },
                  secondaryButton: .cancel())
        }
        .sheet(item: $showingPortObject) { object in
            PortObjectView(portObject: Binding(get: {
                object
            }, set: { newValue in
                data.editPortObject(newValue)
            }))
        }
        .onAppear() {
            data.ports = OutletDataSource.load()
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
