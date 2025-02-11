//
//  ViewFactory.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

protocol ViewFactory {
    associatedtype V: View
    @ViewBuilder func makeView(for route: Route) -> V
}

final class AppViewFactory: ViewFactory {
    @ViewBuilder
    func makeView(for route: Route) -> some View {
        switch route {
        case .locationFeed(let location):
            LocationFeedView(
                viewModel: LocationFeedViewModel(location: location)
            )
        case .photoCapture:
            PhotoCaptureView()
        }
    }
}
