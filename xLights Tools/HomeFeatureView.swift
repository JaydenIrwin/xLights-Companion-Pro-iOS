//
//  HomeFeatureView.swift
//  xLights Tools
//
//  Created by Jayden Irwin on 2021-04-14.
//

import SwiftUI

struct HomeFeatureView: View {
    
    @State var headline: String
    @State var title: String
    @State var image: Image
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text(headline.uppercased())
                        .font(.headline)
                        .foregroundColor(.accentColor)
                    Text(title)
                        .font(.title)
                }
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.displayP3, white: 0.0, opacity: 0.6666))
        }
        .frame(minWidth: 0, maxWidth: 500, idealHeight: 200, alignment: .bottom)
        .background(image.resizable().aspectRatio(contentMode: .fill))
        .cornerRadius(16)
        .foregroundColor(Color.white)
    }
}

struct HomeFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeatureView(headline: "", title: "", image: Image(""))
    }
}
