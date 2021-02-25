//
//  DoubleInputRow.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-02-24.
//

import SwiftUI

struct DoubleInputRow: View {
    
    static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = Int.max
        return formatter
    }()
    
    @State var title: String
    @State var placeholder: String
    let unit: String
    @State var disabled: Bool
    
    @Binding var value: Double?
    
    var body: some View {
        HStack {
            Text(title)
                .accessibilityHidden(true)
            Spacer()
            TextField(placeholder, text: Binding(get: {
                if let value = value {
                    return DoubleInputRow.formatter.string(from: NSNumber(value: value)) ?? ""
                } else {
                    return ""
                }
            }, set: { (newValue) in
                value = Double(newValue)
            }))
            .multilineTextAlignment(.trailing)
            .keyboardType(.decimalPad)
            .accessibility(label: Text(title))
            .disabled(disabled)
            Text(unit)
        }
    }
}

struct DoubleInputRow_Previews: PreviewProvider {
    static var previews: some View {
        DoubleInputRow(title: "", placeholder: "", unit: "", disabled: false, value: .constant(1))
    }
}
