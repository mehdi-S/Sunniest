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
    // MARK: - Dependencies
    private let captureManager: PhotoCapturing
    private let viewFactory: AppViewFactory

    // MARK: - Initialization
    init() {
        self.captureManager = PhotoCaptureManager.shared
        self.viewFactory = AppViewFactory(captureManager: captureManager)
    }

    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            SearchLocationView(viewModel: SearchLocationViewModel())
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
