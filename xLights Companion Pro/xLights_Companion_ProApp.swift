//
//  xLights_Companion_ProApp.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-01-16.
//

import SwiftUI

@main
struct xLights_Companion_ProApp: App {
    
    enum Tab {
        case home, arProps, tools, search
    }
    
    @State var selectedTab = Tab.home
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab) {
                HomeView(selectedTab: $selectedTab)
                    .tag(Tab.home)
                ARPropView()
                    .tag(Tab.arProps)
                ToolsView()
                    .tag(Tab.tools)
                SearchView()
                    .tag(Tab.search)
            }
        }
    }
}

enum UnitSystem {
    case imperial
    case metric
}
