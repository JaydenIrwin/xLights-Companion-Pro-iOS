//
//  PortObjectView.swift
//  xLights Companion Pro
//
//  Created by Nicholas Long on 2021-03-16.
//

import SwiftUI

struct ItemView: View {
    
    @Binding var portObject: PortObject
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Text("Name")
                        Spacer()
                            .frame(width: 20)
                        TextField("", text: Binding(get: {portObject.name ?? ""}, set: { newValue in
                            portObject.name = newValue
                        }))
                    }
                    HStack {
                        Text("Pixels")
                        Spacer()
                            .frame(width: 20)
                        TextField("", text: Binding(get: {"\(portObject.pixels ?? 0)"}, set: { newValue in
                            portObject.pixels = Int(newValue)
                        }))
                            .keyboardType(.numberPad)
                    }
                }
                .onTapGesture {hideKeyboard()}
            }
            .navigationTitle("New Item")
            .toolbar {
                Button("Done") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(portObject: .constant(PortObject(name: "", pixels: nil)))
    }
}
