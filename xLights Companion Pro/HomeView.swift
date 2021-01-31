//
//  HomeView.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-01-30.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Getting Started".uppercased())
                            .font(.headline)
                            .foregroundColor(Color(UIColor.secondaryLabel))
                        Text("Preview Props In AR")
                            .font(.title)
                    }
                    Spacer()
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(8)
                .padding()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Setup Your Lights".uppercased())
                            .font(.headline)
                            .foregroundColor(Color(UIColor.secondaryLabel))
                        Text("Power Calculator")
                            .font(.title)
                    }
                    Spacer()
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(8)
                .padding()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Jam Out".uppercased())
                            .font(.headline)
                            .foregroundColor(Color(UIColor.secondaryLabel))
                        Text("Search For Songs")
                            .font(.title)
                    }
                    Spacer()
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(8)
                .padding()
            }
            .frame(idealWidth: 512, maxWidth: .infinity)
            .navigationTitle("Home")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .tabItem { Label("Home", systemImage: "house.fill") }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
