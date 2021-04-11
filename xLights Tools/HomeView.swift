//
//  HomeView.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-01-30.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var selectedTab: XLightsToolsApp.Tab
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    VStack {
                        Spacer()
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Getting Started".uppercased())
                                    .font(.headline)
                                    .foregroundColor(Color(UIColor.lightGray))
                                Text("Preview Props In AR")
                                    .font(.title)
                            }
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.displayP3, white: 0.0, opacity: 0.75))
                    }
                    .frame(minWidth: 0, maxWidth: 500, idealHeight: 200, alignment: .bottom)
                    .background(Image("Home AR").resizable().aspectRatio(contentMode: .fill))
                    .cornerRadius(16)
                    .foregroundColor(Color.white)
                    .onTapGesture {
                        selectedTab = .arProps
                    }
                    VStack {
                        Spacer()
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Setup Your Lights".uppercased())
                                    .font(.headline)
                                    .foregroundColor(Color(UIColor.lightGray))
                                Text("Power Calculator")
                                    .font(.title)
                            }
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.displayP3, white: 0.0, opacity: 0.75))
                    }
                    .frame(minWidth: 0, maxWidth: 500, idealHeight: 200, alignment: .bottom)
                    .background(Image("Home Power").resizable().aspectRatio(contentMode: .fill))
                    .cornerRadius(16)
                    .foregroundColor(Color.white)
                    .onTapGesture {
                        selectedTab = .tools
                    }
                    VStack {
                        Spacer()
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Jam Out".uppercased())
                                    .font(.headline)
                                    .foregroundColor(Color(UIColor.lightGray))
                                Text("Search For Songs")
                                    .font(.title)
                            }
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.displayP3, white: 0.0, opacity: 0.75))
                    }
                    .frame(minWidth: 0, maxWidth: 500, idealHeight: 200, alignment: .bottom)
                    .background(Image("Home Music").resizable().aspectRatio(contentMode: .fill))
                    .cornerRadius(16)
                    .foregroundColor(Color.white)
                    .onTapGesture {
                        selectedTab = .search
                    }
                    VStack(alignment: .leading, spacing: 14) {
                        Label("Links", systemImage: "link")
                        ForEach(RelatedWebsite.websites) { website in
                            Divider()
                            Link(destination: website.url) {
                                Label(website.name, systemImage: website.iconName)
                            }
                        }
                    }
                    .padding()
                    .frame(idealWidth: 500, maxWidth: 500, alignment: .leading)
                    .background(Color(UIColor.secondarySystemGroupedBackground))
                    .cornerRadius(16)
                    VStack(alignment: .leading, spacing: 14) {
                        Label("Facebook Groups", systemImage: "person.2.circle")
                        ForEach(RelatedWebsite.facebookGroups) { website in
                            Divider()
                            Link(destination: website.url) {
                                Label(website.name, systemImage: website.iconName)
                            }
                        }
                    }
                    .padding()
                    .frame(idealWidth: 500, maxWidth: 500, alignment: .leading)
                    .background(Color(UIColor.secondarySystemGroupedBackground))
                    .cornerRadius(16)
                }
                .padding()
                .frame(idealWidth: .infinity, maxWidth: .infinity)
            }
            .background(Color(UIColor.systemGroupedBackground))
            .navigationTitle("Home")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .tabItem { Label("Home", systemImage: "house.fill") }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selectedTab: .constant(.home))
    }
}
