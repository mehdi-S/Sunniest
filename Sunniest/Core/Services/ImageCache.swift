//
//  ImageCache.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

actor ImageCache {
    // MARK: - Singleton
    static let shared = ImageCache()

    // MARK: - Properties
    private var cache: [String: Image] = [:]

    // MARK: - Methods
    func insert(_ image: Image, for key: String) {
        cache[key] = image
    }

    func get(_ key: String) -> Image? {
        cache[key]
    }
}
