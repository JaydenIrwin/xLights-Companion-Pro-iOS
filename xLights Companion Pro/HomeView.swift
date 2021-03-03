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
                    .background(Image("Home 1").resizable().aspectRatio(contentMode: .fill))
                    .cornerRadius(16)
                    .foregroundColor(Color.white)
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
                    .background(Image("Home 2").resizable().aspectRatio(contentMode: .fill))
                    .cornerRadius(16)
                    .foregroundColor(Color.white)
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
                    .background(Image("Home 1").resizable().aspectRatio(contentMode: .fill))
                    .cornerRadius(16)
                    .foregroundColor(Color.white)
                    VStack(alignment: .leading, spacing: 14) {
                        Group {
                            Label("Links", systemImage: "link")
                            Divider()
                            Link(destination: URL(string: "www.apple.com")!) {
                                Label("xLights Discord", systemImage: "gamecontroller")
                            }
                            Divider()
                            Link(destination: URL(string: "www.apple.com")!) {
                                Label("xLights Reddit", systemImage: "face.smiling")
                            }
                            Divider()
                            Link(destination: URL(string: "www.apple.com")!) {
                                Label("xLights Website", systemImage: "globe")
                            }
                            Divider()
                            Link(destination: URL(string: "https://us02web.zoom.us/j/175801909")!) {
                                Label("Zoom", systemImage: "video")
                            }
                        }
                        Group {
                            Divider()
                            Link(destination: URL(string: "www.apple.com")!) {
                                Label("Remote Falcon", systemImage: "swift")
                            }
                            Divider()
                            Link(destination: URL(string: "www.apple.com")!) {
                                Label("Parts Store 1", systemImage: "bag")
                            }
                            Divider()
                            Link(destination: URL(string: "www.apple.com")!) {
                                Label("Parts Store 2", systemImage: "bag")
                            }
                            Divider()
                            Link(destination: URL(string: "www.apple.com")!) {
                                Label("Parts Store 3", systemImage: "bag")
                            }
                            Divider()
                            Link(destination: URL(string: "www.apple.com")!) {
                                Label("Beginer's Tutorial Videos", systemImage: "play.rectangle")
                            }
                        }
                    }
                    .padding()
                    .frame(idealWidth: 500, maxWidth: 500, alignment: .leading)
                    .background(Color(UIColor.secondarySystemGroupedBackground))
                    .cornerRadius(16)
                    VStack(alignment: .leading, spacing: 14) {
                        Group {
                            Label("Facebook Groups", systemImage: "person.2.circle")
                            Divider()
                            Link(destination: URL(string: "https://www.facebook.com/groups/233383237101011/")!) {
                                Label("Group", systemImage: "person.2.circle")
                            }
                            Divider()
                            Link(destination: URL(string: "https://www.facebook.com/groups/2260596274198602/")!) {
                                Label("Group", systemImage: "person.2.circle")
                            }
                            Divider()
                            Link(destination: URL(string: "https://www.facebook.com/groups/469315706587218/")!) {
                                Label("Group", systemImage: "person.2.circle")
                            }
                            Divider()
                            Link(destination: URL(string: "https://www.facebook.com/groups/HolidayThinkTank/")!) {
                                Label("Holiday Think Tank", systemImage: "person.2.circle")
                            }
                        }
                        Group {
                            Divider()
                            Link(destination: URL(string: "https://www.facebook.com/groups/HolidayLightShowVendors/")!) {
                                Label("Holiday Light Show Vendors", systemImage: "person.2.circle")
                            }
                            Divider()
                            Link(destination: URL(string: "https://www.facebook.com/groups/353601265519768/")!) {
                                Label("Group", systemImage: "person.2.circle")
                            }
                            Divider()
                            Link(destination: URL(string: "https://www.facebook.com/groups/socalchristmas/")!) {
                                Label("Social Christmas", systemImage: "person.2.circle")
                            }
                            Divider()
                            Link(destination: URL(string: "https://www.facebook.com/groups/186301722156865/")!) {
                                Label("Group", systemImage: "person.2.circle")
                            }
                            Divider()
                            Link(destination: URL(string: "https://www.facebook.com/groups/PixelProU/")!) {
                                Label("Pixel Pro U", systemImage: "person.2.circle")
                            }
                        }
                        Group {
                            Divider()
                            Link(destination: URL(string: "https://www.facebook.com/groups/pixel2things/")!) {
                                Label("Pixel 2 Things", systemImage: "person.2.circle")
                            }
                            Divider()
                            Link(destination: URL(string: "https://www.facebook.com/pixelprodisplays")!) {
                                Label("Pixel Pro Displays", systemImage: "person.2.circle")
                            }
                            Divider()
                            Link(destination: URL(string: "https://www.facebook.com/groups/xLights/")!) {
                                Label("xLights", systemImage: "person.2.circle")
                            }
                            Divider()
                            Link(destination: URL(string: "https://www.facebook.com/groups/1901299436791951/")!) {
                                Label("Group", systemImage: "person.2.circle")
                            }
                            Divider()
                            Link(destination: URL(string: "https://www.facebook.com/jdeation/")!) {
                                Label("jdeation", systemImage: "person.2.circle")
                            }
                        }
                        Group {
                            Divider()
                            Link(destination: URL(string: "https://www.facebook.com/HSSUSC/")!) {
                                Label("HSSUSC", systemImage: "person.2.circle")
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
        HomeView()
    }
}
