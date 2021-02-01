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
            List {
                Section {
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
                }
                Section {
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
                }
                Section {
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
                }
                Section(header: Label("Links", systemImage: "link")) {
                    Link(destination: URL(string: "www.apple.com")!) {
                        Label("xLights Discord", systemImage: "gamecontroller")
                    }
                    Link(destination: URL(string: "www.apple.com")!) {
                        Label("xLights Reddit", systemImage: "face.smiling")
                    }
                    Link(destination: URL(string: "www.apple.com")!) {
                        Label("xLights Website", systemImage: "globe")
                    }
                    Link(destination: URL(string: "www.apple.com")!) {
                        Label("Music Store 1", systemImage: "music.note.list")
                    }
                    Link(destination: URL(string: "www.apple.com")!) {
                        Label("Music Store 2", systemImage: "music.note.list")
                    }
                    Link(destination: URL(string: "www.apple.com")!) {
                        Label("Music Store 3", systemImage: "music.note.list")
                    }
                    Link(destination: URL(string: "www.apple.com")!) {
                        Label("Beginer's Tutorial Videos", systemImage: "play.rectangle")
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .frame(maxWidth: 512)
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
