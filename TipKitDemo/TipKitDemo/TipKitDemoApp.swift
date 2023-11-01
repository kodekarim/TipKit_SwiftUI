//
//  TipKitDemoApp.swift
//  TipKitDemo
//
//  Created by abdul karim on 29/10/23.
//

import SwiftUI
import TipKit

@main
struct TipKitDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ExploreSwiftUIView()
                .task {
                    try? Tips.configure([
                        .displayFrequency(.immediate),
                        .datastoreLocation(.applicationDefault)
                    ])
                }
        }
    }
}
