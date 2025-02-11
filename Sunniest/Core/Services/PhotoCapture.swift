//
//  ImageCapture.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

@Observable
final class PhotoCaptureManager: PhotoCapturing {
   // MARK: - Singleton
   static let shared = PhotoCaptureManager()

   // MARK: - Properties
   var capturedImageFeedItemRepresentation: FeedItem?

    // MARK: - Init
    private init() {}
}

// MARK: - Protocol
protocol PhotoCapturing {
    var capturedImageFeedItemRepresentation: FeedItem? { get set }
}
