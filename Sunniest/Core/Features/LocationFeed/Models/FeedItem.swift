//
//  FeedItem.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

struct FeedItem: Identifiable, Hashable {
    let id = UUID()
    let imageURL: URL
    let description: String
}
