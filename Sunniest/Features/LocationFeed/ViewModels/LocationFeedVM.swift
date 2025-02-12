//
//  LocationFeedVM.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

// MARK: - ViewModel
@Observable
final class LocationFeedViewModel {
    // MARK: - Properties
    private(set) var items: [FeedItem] = []
    let location: LocationDTO

    // MARK: - Dependencies
    private let viewFactory: AppViewFactory

    // MARK: - Initialization
    init(location: LocationDTO, viewFactory: AppViewFactory = AppViewFactory()) {
        self.location = location
        self.viewFactory = viewFactory
        setupMockData()
    }

    // MARK: - Methods
    func handleCapturedPhoto(_ feedItem: FeedItem) {
        items.insert(feedItem, at: 0)
    }

    func navigateToPhotoCapture(router: Router) {
        router.navigate(to: .photoCapture)
    }

    @ViewBuilder
    func makeViewForRoute(_ route: Route) -> some View {
        viewFactory.makeView(for: route)
    }

    // MARK: - Private Methods
    private func setupMockData() {
        items = [
            FeedItem(
                image: ImageDisplayable(value: .system(systemId: "picture2")),
                takenAt: "less than a minutes ago"
            ),
            FeedItem(
                image: ImageDisplayable(value: .system(systemId: "picture3")),
                takenAt: "9 minutes ago"
            ),
            FeedItem(
                image: ImageDisplayable(value: .system(systemId: "picture4")),
                takenAt: "22 minutes ago"
            ),
            FeedItem(
                image: ImageDisplayable(value: .async(networkId: "https://picsum.photos/536/354")),
                takenAt: "1 hour ago"
            )
        ]
    }
}
