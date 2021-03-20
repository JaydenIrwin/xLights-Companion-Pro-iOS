//
//  PortObjectView.swift
//  xLights Companion Pro
//
//  Created by Nicholas Long on 2021-03-16.
//

import SwiftUI

struct PortItemView: View {
    
    @Binding var portItem: PortItem
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Text("Name")
                        Spacer()
                            .frame(width: 20)
                        TextField("", text: Binding(get: {portItem.name ?? ""}, set: { newValue in
                            portItem.name = newValue
                        }))
                    }
                    HStack {
                        Text("Pixels")
                        Spacer()
                            .frame(width: 20)
                        TextField("", value: $portItem.pixels, formatter: NumberFormatter())
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

struct PortItemView_Previews: PreviewProvider {
    static var previews: some View {
        PortItemView(portItem: .constant(PortItem(name: "", pixels: 0, controller: nil)))
    }
}
