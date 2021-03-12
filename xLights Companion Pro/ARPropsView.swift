//
//  ARMainView.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-01-30.
//

import SwiftUI

struct ARPropsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var selectedProp = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 250))]) {
                    ForEach(Prop.allProps) { prop in
                        Image(prop.iconName)
                            .resizable()
                            .aspectRatio(1, contentMode: ContentMode.fit)
                            .background(Color(UIColor.secondarySystemGroupedBackground))
                            .overlay(Image(systemName: "arkit").imageScale(.large).foregroundColor(.white).padding(), alignment: .bottomTrailing)
                            .cornerRadius(16)
                            .onTapGesture {
                                selectedProp = true
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

struct ARMainView_Previews: PreviewProvider {
    static var previews: some View {
        ARPropsView()
    }
}
