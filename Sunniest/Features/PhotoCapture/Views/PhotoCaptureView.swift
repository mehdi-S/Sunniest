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
            viewModel.storeCapturedImage(FeedItem(
                image: ImageDisplayable(value: .system(systemId: "picture1")),
                takenAt: "0 seconds ago"))
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
