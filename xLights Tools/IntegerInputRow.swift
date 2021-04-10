//
//  IntegerInputRow.swift
//  xLights Companion Pro
//
//  Created by Nicholas Long on 2021-02-24.
//

import SwiftUI

struct IntegerInputRow: View {
    
    static let formatter = NumberFormatter()
    
    @State var title: String
    @State var placeholder: String
    let unit: String
    
    @Binding var value: Int?
    
    var body: some View {
        HStack {
            Text(title)
                .accessibilityHidden(true)
            Spacer()
            TextField(placeholder, text: Binding(get: {
                if let value = value {
                    return IntegerInputRow.formatter.string(from: NSNumber(value: value)) ?? ""
                } else {
                    return ""
                }
            }, set: { (newValue) in
                value = Int(newValue)
            }))
            .multilineTextAlignment(.trailing)
            .keyboardType(.numberPad)
            .accessibility(label: Text(title))
            Text(unit)
                .frame(width: 60, alignment: .trailing)
        }
    }
}

struct IntegerInputRow_Previews: PreviewProvider {
    static var previews: some View {
        IntegerInputRow(title: "", placeholder: "", unit: "", value: .constant(1))
    }
}

