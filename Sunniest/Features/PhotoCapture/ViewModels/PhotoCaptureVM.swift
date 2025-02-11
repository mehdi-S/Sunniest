//
//  PhotoCaptureVM.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

@Observable
final class PhotoCaptureViewModel {
    private let captureManager = PhotoCaptureManager.shared

    func storeCapturedImage(_ bundleID: String) {
        captureManager.capturedImageBundleID = bundleID
    }
}
