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
    private let router = Router()
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

    @ViewBuilder
    func makeViewForRoute(_ route: Route) -> some View {
        viewFactory.makeView(for: route)
    }

    // MARK: - Private Methods
    private func setupMockData() {
        items = [
            FeedItem(
                image: ImageDisplayable(value: .async(networkId: "https://picsum.photos/400/300")),
                takenAt: "25 seconds ago"
            ),
            FeedItem(
                image: ImageDisplayable(value: .async(networkId: "https://picsum.photos/400/301")),
                takenAt: "11 minutes ago"
            ),
            FeedItem(
                image: ImageDisplayable(value: .async(networkId: "https://picsum.photos/400/302")),
                takenAt: "1 hour ago"
            )
        ]
    }
}
