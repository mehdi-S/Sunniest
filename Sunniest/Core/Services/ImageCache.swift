//
//  ImageCache.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

actor ImageCache {
    static let shared = ImageCache()
    private var cache: [URL: Image] = [:]

    func insert(_ image: Image, for key: URL) {
        cache[key] = image
    }

    func get(_ key: URL) -> Image? {
        cache[key]
    }
}
