//
//  OutletOrganizer.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-02-03.
//

import SwiftUI

struct PropOrganizer: View {
    
    @ObservedObject var data = OutletDataSource()
    
    @State var showingProp: OrganizerProp?
    @State var deleteAlert = false
    
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(data.ports) { (port) in
                    Section {
                        PropCell(title: "Port \(port.number)", description: "\(port.pixels) px", isPort: true)
                        .contextMenu {
                            Button {
                                data.removePort(port)
                            } label : {
                                Label("Remove", systemImage: "trash")
                            }
                        }
                        
                        ForEach(Array(port.props.enumerated()), id: \.1.id) { index, object in
                            PropCell(title: object.name, description: "\(object.pixels) px", isPort: false)
                            .onTapGesture {
                                showingProp = object
                            }
                            .contextMenu {
                                Menu {
                                    ForEach(data.ports) { newPort in
                                        Button(action: {
                                            data.moveProp(object, to: newPort)
                                        }, label: {
                                            Label("Port \(newPort.number)", systemImage: "power")
                                        })
                                    }
                                } label: {
                                    Label("Move to...", systemImage: "arrow.turn.down.right")
                                }
                                Button {
                                    data.removeProp(object)
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
        .navigationTitle("Prop Organizer")
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button(action: {
                        data.addNewPort()
                    }, label: {
                        Label("Add Port", systemImage: "power")
                    })
                    Button(action: {
                        showingProp = data.addNewPortObject()
                    }, label: {
                        Label("Add Prop", systemImage: "lightbulb")
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
        .sheet(item: $showingProp) { object in
            PropEditView(data: data, uuid: object.uuid, name: object.name, pixels: object.pixels)
        }
        .onAppear() {
            data.ports = OutletDataSource.load()
        }
    }
    
}

struct PropOrganizer_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PropOrganizer()
        }
    }
}
