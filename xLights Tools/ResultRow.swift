//
//  ResultRow.swift
//  xLights Companion Pro
//
//  Created by Nicholas Long on 2021-03-04.
//

import SwiftUI

struct ResultRow: View {
    
    @State var title : String
    
    @Binding var value : Double?
    
    let unit : String
    let unitFrame : Int
    
    var roundedValue: String? {
        if let value = value{
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 2
            
            return formatter.string(from: NSNumber(value: value))
        } else {
            return nil
        }
    }
    
    var body: some View {
        HStack{
            Text(title)
            Spacer()
            if let roundedValue = roundedValue {
                Text(roundedValue)
                    .multilineTextAlignment(.trailing)
            }
            Text(unit)
                .frame(width: CGFloat(unitFrame), alignment: .trailing)
        }
    }
}

struct ResultRow_Previews: PreviewProvider {
    static var previews: some View {
        ResultRow(title: "hello", value: .constant(1.0), unit: "hello", unitFrame: 50)
    }
}
