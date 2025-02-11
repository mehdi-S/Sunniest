//
//  LocationFeedVM.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

@Observable
final class LocationFeedViewModel {
    private(set) var items: [FeedItem] = []
    let location: LocationDTO

    init(location: LocationDTO) {
        self.location = location
        items = [
            FeedItem(
                imageURL: URL(string: "https://picsum.photos/400/300")!,
                description: "A beautiful landscape"
            ),
            FeedItem(
                imageURL: URL(string: "https://picsum.photos/400/301")!,
                description: "City life"
            ),
            FeedItem(
                imageURL: URL(string: "https://picsum.photos/400/302")!,
                description: "Nature's beauty"
            )
        ]
    }
}
