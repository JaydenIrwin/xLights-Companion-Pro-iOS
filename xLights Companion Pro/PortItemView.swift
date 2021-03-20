//
//  PortObjectView.swift
//  xLights Companion Pro
//
//  Created by Nicholas Long on 2021-03-16.
//

import SwiftUI

struct PortItemView: View {
    
    @Binding var portItem: PortItem
    
    var body: some View {
        NavigationView {
            Form {
                TextField("", text: <#T##Binding<String>#>)
            }
        }
    }
}

struct PortItemView_Previews: PreviewProvider {
    static var previews: some View {
        PortItemView(portItem: .constant(PortItem(name: "", pixels: 0, controller: nil)))
    }
}
