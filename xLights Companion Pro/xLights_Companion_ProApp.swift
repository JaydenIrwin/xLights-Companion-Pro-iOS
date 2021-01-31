//
//  xLights_Companion_ProApp.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-01-16.
//

import SwiftUI

@main
struct xLights_Companion_ProApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                ARPropsView()
                ToolsView()
                LinksView()
                SearchView()
            }
        }
    }
}
