//
//  PortObjectView.swift
//  xLights Companion Pro
//
//  Created by Nicholas Long on 2021-03-16.
//

import SwiftUI

struct PropEditView: View {
    
    @ObservedObject var data: OutletDataSource
    
    @State var uuid: UUID
    @State var name: String
    @State var pixels: Int
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Text("Name")
                        Spacer()
                            .frame(width: 20)
                        TextField("", text: $name, onEditingChanged: { isEditing in
                            data.editProp(uuid: uuid, name: name, pixels: pixels)
                        })
                    }
                    HStack {
                        Text("Pixels")
                        Spacer()
                            .frame(width: 20)
                        TextField("", text: Binding(get: { String(pixels) }, set: { newValue in
                            pixels = Int(newValue) ?? 0
                            data.editProp(uuid: uuid, name: name, pixels: pixels)
                        }))
                            .keyboardType(.numberPad)
                    }
                }
                .onTapGesture {hideKeyboard()}
            }
            .navigationTitle("New Prop")
            .toolbar {
                Button("Done") {
                    data.editProp(uuid: uuid, name: name, pixels: pixels)
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct PortObjectView_Previews: PreviewProvider {
    static var previews: some View {
        PropEditView(data: OutletDataSource(), uuid: UUID(), name: "", pixels: 0)
    }
}
