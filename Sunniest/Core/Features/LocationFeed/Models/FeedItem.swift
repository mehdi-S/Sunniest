//
//  FeedItem.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

struct FeedItem: Identifiable, Hashable {
    var id: Self { self }
    let image: ImageDisplayable
    let description: String
}
