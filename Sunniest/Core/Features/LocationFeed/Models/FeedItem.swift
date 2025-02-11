//
//  FeedItem.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

struct FeedItem: Identifiable, Hashable {
    var id = UUID()
    let image: ImageDisplayable
    let takenAt: String
}
