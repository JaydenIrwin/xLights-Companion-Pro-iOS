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
        RelatedWebsite(url: "www.apple.com", name: "xLights Discord", iconName: "gamecontroller"),
        RelatedWebsite(url: "www.apple.com", name: "xLights Reddit", iconName: "face.smiling"),
        RelatedWebsite(url: "www.apple.com", name: "xLights Website", iconName: "globe"),
        RelatedWebsite(url: "https://us02web.zoom.us/j/175801909", name: "Zoom", iconName: "video"),
        RelatedWebsite(url: "www.apple.com", name: "Remote Falcon", iconName: "swift"),
        RelatedWebsite(url: "www.apple.com", name: "Parts Store 1", iconName: "bag"),
        RelatedWebsite(url: "www.apple.com", name: "Parts Store 2", iconName: "bag"),
        RelatedWebsite(url: "www.apple.com", name: "Parts Store 3", iconName: "bag"),
        RelatedWebsite(url: "www.apple.com", name: "Beginer's Tutorial Videos", iconName: "play.rectangle")
    ]
    static let facebookGroups = [
        RelatedWebsite(url: "https://www.facebook.com/groups/233383237101011/", name: "Group", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/groups/2260596274198602/", name: "Group", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/groups/469315706587218/", name: "Group", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/groups/HolidayThinkTank/", name: "Holiday Think Tank", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/groups/HolidayLightShowVendors/", name: "Holiday Light Show Vendors", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/groups/353601265519768/", name: "Group", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/groups/socalchristmas/", name: "Social Christmas", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/groups/186301722156865/", name: "Group", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/groups/PixelProU/", name: "Pixel Pro U", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/groups/pixel2things/", name: "Pixel 2 Things", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/pixelprodisplays", name: "Pixel Pro Displays", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/groups/xLights/", name: "xLights", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/groups/1901299436791951/", name: "Group", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/jdeation/", name: "jdeation", iconName: "person.2.circle"),
        RelatedWebsite(url: "https://www.facebook.com/HSSUSC/", name: "HSSUSC", iconName: "person.2.circle")
    ]
    
}
