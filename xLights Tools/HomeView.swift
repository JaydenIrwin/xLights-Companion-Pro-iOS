//
//  HomeView.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-01-30.
//

import SwiftUI

struct HomeView: View {
    
    #if targetEnvironment(macCatalyst)
    let isCatalyst = true
    #else
    let isCatalyst = false
    #endif
    
    @Binding var selectedTab: XLightsToolsApp.Tab
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    #if !targetEnvironment(macCatalyst)
                    HomeFeatureView(headline: "Getting Started", title: "Preview Props In AR", image: Image("Home AR"))
                    .onTapGesture {
                        selectedTab = .arProps
                    }
                    #endif
                    HomeFeatureView(headline: "Setup Your Lights", title: "Power Calculator", image: Image("Home Power"))
                    .onTapGesture {
                        selectedTab = .tools
                    }
                    HomeFeatureView(headline: "Jam Out", title: "Search For Songs", image: Image("Home Music"))
                    .onTapGesture {
                        selectedTab = .search
                    }
                    VStack(alignment: .leading, spacing: 14) {
                        Label("Promotion", systemImage: "musicnote")
                        Button {
                            
                        } label: {Label("Promotion", systemImage: "musicnote")}
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
            .navigationBarHidden(isCatalyst)
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
