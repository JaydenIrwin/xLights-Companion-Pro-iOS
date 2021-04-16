//
//  PortObjectView.swift
//  xLights Companion Pro
//
//  Created by Nicholas Long on 2021-03-16.
//

import SwiftUI

struct PortObjectView: View {
    
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
                        TextField("", text: $portObject.name)
                    }
                    HStack {
                        Text("Pixels")
                        Spacer()
                            .frame(width: 20)
                        TextField("", text: Binding(get: { String(portObject.pixels) }, set: { newValue in
                            portObject.pixels = Int(newValue) ?? 0
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

struct PortObjectView_Previews: PreviewProvider {
    static var previews: some View {
        PortObjectView(portObject: .constant(PortObject(name: "", pixels: 0)))
    }
}
