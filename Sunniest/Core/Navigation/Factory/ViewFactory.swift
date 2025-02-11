//
//  ViewFactory.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

// MARK: - Protocol
protocol ViewFactory {
    associatedtype V: View
    @ViewBuilder func makeView(for route: Route) -> V
}

// MARK: - Factory
final class AppViewFactory: ViewFactory {
    // MARK: - Dependencies
    private let captureManager: PhotoCapturing

    // MARK: - Initialization
    init(captureManager: PhotoCapturing = PhotoCaptureManager.shared) {
        self.captureManager = captureManager
    }

    @ViewBuilder
    func makeView(for route: Route) -> some View {
        switch route {
        case .locationFeed(let location):
            LocationFeedView(
                viewModel: LocationFeedViewModel(location: location),
                captureManager: captureManager
            )
        case .photoCapture:
            PhotoCaptureView()
        }
    }
}
