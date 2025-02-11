//
//  ImageCapture.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

@Observable
final class PhotoCaptureManager {
   // MARK: - Singleton
   static let shared = PhotoCaptureManager()
   private init() {}

   // MARK: - Properties
   var capturedImageFeedItemRepresentation: FeedItem?
}
