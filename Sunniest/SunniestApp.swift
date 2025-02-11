//
//  SunniestApp.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI
import TipKit

@main
struct SunniestApp: App {
    var body: some Scene {
        WindowGroup {
            SearchLocationView()
                .tint(.accentColor)
                .task {
                    try? Tips.configure([
                        .displayFrequency(.immediate),
                        .datastoreLocation(.applicationDefault)
                    ])
                    try? Tips.resetDatastore()
                }
        }
    }
}
