//
//  LocationFeedView.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

struct LocationFeedView: View {
    @State private var viewModel: LocationFeedViewModel
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    @Environment(Router.self) private var router
    private let sizeService = DynamicSizeService()
    private let photoCaptureManager = PhotoCaptureManager.shared
    private var cameraTip = CameraButtonTip()
    struct Constants {
        static let verticalSpacing: CGFloat = 20
    }

    init(viewModel: LocationFeedViewModel) {
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        ScrollView {
            contentSection
        }
        .overlay(alignment: .bottomTrailing) {
            PhotoButtonView {
                CameraButtonTip.buttonWasTapped.toggle()
                router.navigate(to: .photoCapture)
            }
            .popoverTip(cameraTip)
            .padding(.trailing, sizeService.padding(for: dynamicTypeSize))
        }
        .onChange(of: photoCaptureManager.capturedImageFeedItemRepresentation) { oldValue, newValue in
            if let bundleID = newValue {
                viewModel.handleCapturedPhoto(bundleID)
                photoCaptureManager.capturedImageFeedItemRepresentation = nil
            }
        }
        .navigationDestination(for: Route.self) { route in
            viewModel.makeViewForRoute(route)
        }
        .defaultBackground()
        .navigationTitle(viewModel.location.name)
    }

    private var contentSection: some View {
        LazyVStack(spacing: Constants.verticalSpacing) {
            ForEach(viewModel.items) { item in
                FeedItemView(item: item)
            }
        }
        .padding(.vertical)
    }
}

#Preview("Feed") {
    NavigationStack {
        LocationFeedView(viewModel: LocationFeedViewModel(location: LocationDTO.preview()))
    }
    .environment(Router())
}
