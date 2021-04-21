//
//  ARMainView.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-01-30.
//

import SwiftUI

struct ARPropsBrowser: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var selectedProp: PropModel?
    
    @State private var localSelectedProp: PropModel?
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 250))]) {
                    ForEach(PropModel.allProps) { prop in
                        Image(prop.iconName)
                            .resizable()
                            .aspectRatio(1, contentMode: ContentMode.fit)
                            .background(Color(UIColor.secondarySystemGroupedBackground))
                            .overlay(prop == localSelectedProp ? RoundedRectangle(cornerRadius: 16).strokeBorder(Color.accentColor, lineWidth: 4) : nil)
                            .overlay(
                                Image(systemName: "arkit")
                                    .imageScale(.large)
                                    .foregroundColor(.white)
                                    .padding()
                            , alignment: .bottomTrailing)
                            .cornerRadius(16)
                            .onTapGesture {
                                selectedProp = prop
                                localSelectedProp = prop
                                presentationMode.wrappedValue.dismiss()
                            }
                    }
                }
                .padding()
            }
            .background(Color(UIColor.systemGroupedBackground))
            .navigationTitle("AR Props")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .toolbar {
            Button("Done") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}
