//
//  SunniestApp.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

@main
struct SunniestApp: App {
    var body: some Scene {
        WindowGroup {
            SearchLocationView()
                .tint(.accentColor)
        }
    }
}
