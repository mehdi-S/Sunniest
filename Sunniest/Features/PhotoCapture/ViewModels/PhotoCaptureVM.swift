//
//  PhotoCaptureVM.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

// MARK: - ViewModel
@Observable
final class PhotoCaptureViewModel {
    // MARK: - Dependencies
    private let captureManager = PhotoCaptureManager.shared

    // MARK: - Methods
    func storeCapturedImage(_ feedItem: FeedItem) {
        captureManager.capturedImageFeedItemRepresentation = feedItem
    }
}
