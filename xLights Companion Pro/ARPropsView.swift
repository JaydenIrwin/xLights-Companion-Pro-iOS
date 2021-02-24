//
//  ARMainView.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-01-30.
//

import SwiftUI

struct ARPropsView: View {
    
    @State var selectedProp = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 250))]) {
                    ForEach(0..<10) { (index) in
                        Image(systemName: "arkit")
                            .resizable()
                            .padding()
                            .aspectRatio(1, contentMode: ContentMode.fit)
                            .background(Color(UIColor.secondarySystemGroupedBackground))
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
        .fullScreenCover(isPresented: $selectedProp) {
            ARPropView()
        }
        .tabItem { Label("AR Props", systemImage: "arkit") }
    }
}

struct ARMainView_Previews: PreviewProvider {
    static var previews: some View {
        ARPropsView()
    }
}
