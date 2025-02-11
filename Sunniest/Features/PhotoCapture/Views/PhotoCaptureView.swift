//
//  PhotoCaptureView.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

struct PhotoCaptureView: View {
    @Environment(Router.self) private var router
    @State private var viewModel = PhotoCaptureViewModel()

    var body: some View {
        Button("Capture") {
            viewModel.storeCapturedImage("picture1")
            router.navigateBack()
        }
    }
}

#Preview {
    NavigationStack {
        PhotoCaptureView()
    }
    .environment(Router())
}
