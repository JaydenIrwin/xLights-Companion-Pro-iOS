//
//  MixedLengthResultRow.swift
//  xLights Companion Pro
//
//  Created by Nicholas Long on 2021-03-02.
//

import SwiftUI

struct MixedLengthResultRow: View {
    
    @State var title: String
    @Binding var length : Double?
    
    @Binding var unitSystem: UnitSystem
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            if let length = length {
                Text(mixedLengthString(length).0)
                Text(mixedLengthString(length).1)
                
                HStack {
                    Text(mixedLengthString(length).2)
                    Text(mixedLengthString(length).3)
                }
                .frame(width: 55, alignment: .trailing)
            }
        }
    }
    
    func mixedLengthString(_ value: Double) -> (String, String, String, String) {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 0
        
        if unitSystem == .metric {
            let rounded = value.rounded(.towardZero)
            let meters = Measurement(value: rounded, unit: UnitLength.meters)
            let cms = Measurement(value: value - rounded, unit: UnitLength.meters).converted(to: .centimeters)
            return (formatter.string(from: NSNumber(value: meters.value))!, "m", formatter.string(from: NSNumber(value: cms.value))!, "cm")
        } else {
            let rounded = value.rounded(.towardZero)
            let feet = Measurement(value: rounded, unit: UnitLength.feet)
            let inches = Measurement(value: value - rounded, unit: UnitLength.feet).converted(to: .inches)
            return (formatter.string(from: NSNumber(value: feet.value))!, "ft.", formatter.string(from: NSNumber(value: inches.value))!, "in.")
        }
    }
}

struct MixedLengthResultRow_Previews: PreviewProvider {
    static var previews: some View {
        MixedLengthResultRow(title: "Hello", length: .constant(5.172), unitSystem: .constant(.metric))
    }
}
