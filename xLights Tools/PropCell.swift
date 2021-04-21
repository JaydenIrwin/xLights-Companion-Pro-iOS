//
//  PortObjectCell.swift
//  xLights Tools
//
//  Created by Nicholas Long on 2021-04-16.
//

import SwiftUI

struct PropCell: View {
    
    @State var title: String
    @State var description: String
    @State var isPort: Bool
    
    var body: some View {
        HStack {
            if isPort {
                Spacer()
            }
            VStack(alignment: isPort ? .center : .leading) {
                if isPort {
                    Label(title, systemImage: "power")
                        .font(.system(size: 17, weight: .semibold))
                } else {
                    Text(title)
                        .lineLimit(3)
                }
                Text(description)
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .font(.system(size: 16, weight: isPort ? .medium : .regular))
            }
            Spacer()
        }
        .padding(isPort ? 6 : 12)
        .frame(minHeight: 100)
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(16)
    }
}

struct PortObjectCell_Previews: PreviewProvider {
    static var previews: some View {
        PropCell(title: "", description: "", isPort: true)
    }
}
