//
//  ImageCache.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

actor ImageCache {
    static let shared = ImageCache()
    private var cache: [String: Image] = [:]

    func insert(_ image: Image, for key: String) {
        cache[key] = image
    }

    func get(_ key: String) -> Image? {
        cache[key]
    }
}
