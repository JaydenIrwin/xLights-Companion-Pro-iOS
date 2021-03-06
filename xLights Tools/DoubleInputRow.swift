//
//  DoubleInputRow.swift
//  xLights Companion Pro
//
//  Created by Nicholas Long on 2021-02-24.
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
    @State var disabled: Bool
    
    @Binding var value: Double?
    
    let unit : String
    let unitFrame : Int
    
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
            .frame(width: 35)
            .multilineTextAlignment(.trailing)
            .keyboardType(.decimalPad)
            .accessibility(label: Text(title))
            .disabled(disabled)
            Text(unit)
                .frame(minWidth: CGFloat(unitFrame), idealWidth: CGFloat(unitFrame), alignment: .trailing)
        }
    }
}

struct DoubleInputRow_Previews: PreviewProvider {
    static var previews: some View {
        DoubleInputRow(title: "Hello", placeholder: "Hello", disabled: false, value: .constant(1), unit: "m", unitFrame: 25)
    }
}
