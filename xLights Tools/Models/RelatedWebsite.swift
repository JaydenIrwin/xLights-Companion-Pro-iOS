//
//  RelatedWebsite.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-03-12.
//

import Foundation

struct RelatedWebsite: Identifiable {
    
    let name: String
    let iconName: String
    let url: URL
    var id: URL {
        url
    }
    
    init(url: String, name: String, iconName: String) {
        self.name = name
        self.iconName = iconName
        self.url = URL(string: url)!
    }
    
    static let websites = [
        RelatedWebsite(url: "https://xlights.org", name: "xLights Website", iconName: "globe"),
        RelatedWebsite(url: "https://apps.apple.com/app/xlights/id1137297689", name: "xLights Mac App", iconName: "arrow.down.app"),
        RelatedWebsite(url: "https://us02web.zoom.us/j/175801909", name: "Zoom", iconName: "video"),
        RelatedWebsite(url: "https://www.facebook.com/pixelprodisplays", name: "Pixel Pro Displays", iconName: "flag"),
        RelatedWebsite(url: "https://www.facebook.com/jdeation/", name: "jdeation", iconName: "flag"),
        RelatedWebsite(url: "https://www.facebook.com/HSSUSC/", name: "HSSUSC", iconName: "flag")
    ]
    static let facebookGroups = [
        RelatedWebsite(url: "https://www.facebook.com/groups/233383237101011/", name: "3D Printing For Christmas Light", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/groups/2260596274198602/", name: "European Lighting Fanatics", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/groups/469315706587218/", name: "Extreme Lighting Fanatics of Florida", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/groups/HolidayThinkTank/", name: "Holiday Think Tank", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/groups/HolidayLightShowVendors/", name: "Holiday Light Show Vendors", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/groups/353601265519768/", name: "xLights Singing Faces 3", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/groups/socalchristmas/", name: "Social Christmas", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/groups/186301722156865/", name: "Share Your Holiday Enclosures", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/groups/PixelProU/", name: "Pixel Pro U", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/groups/pixel2things/", name: "Pixel 2 Things", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/groups/xLights/", name: "xLights", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/groups/1901299436791951/", name: "Light O Rama Sequence Sharers", iconName: "person.2.circle"),
    ]
    
}
