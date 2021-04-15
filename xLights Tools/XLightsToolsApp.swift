//
//  xLights_Companion_ProApp.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-01-16.
//

import SwiftUI

@main
struct XLightsToolsApp: App {
    
    enum Tab {
        case home, arProps, tools, search
    }
    
    @State var selectedTab = Tab.home
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab) {
                HomeView(selectedTab: $selectedTab)
                    .tag(Tab.home)
                #if !targetEnvironment(macCatalyst)
                ARPropView()
                    .tag(Tab.arProps)
                #endif
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
