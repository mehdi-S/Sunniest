//
//  ImageCapture.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

@Observable
final class PhotoCaptureManager {
    static let shared = PhotoCaptureManager()
    private init() {}

    var capturedImageBundleID: String?
}
