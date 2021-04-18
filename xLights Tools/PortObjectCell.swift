//
//  PortObjectCell.swift
//  xLights Tools
//
//  Created by Nicholas Long on 2021-04-16.
//

import SwiftUI

struct PortObjectCell: View {
    
    @State var title: String
    @State var description: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                Text(description)
                    .foregroundColor(Color(UIColor.secondaryLabel))
            }
            Spacer()
        }
        .padding(12)
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(16)
    }
}

struct PortObjectCell_Previews: PreviewProvider {
    static var previews: some View {
        PortObjectCell(title: "", description: "")
    }
}
