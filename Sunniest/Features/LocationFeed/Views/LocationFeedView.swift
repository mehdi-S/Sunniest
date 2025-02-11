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
            Button(action: {
                router.navigate(to: .photoCapture)
                CameraButtonTip.buttonWasTapped.toggle()
            }) {
                Image(systemName: "camera.circle.fill")
                    .font(.system(size: sizeService.buttonSize(for: dynamicTypeSize), weight: .medium))
                    .foregroundStyle(.blue)
                    .frame(width: sizeService.frameSize(for: dynamicTypeSize), height: sizeService.frameSize(for: dynamicTypeSize))
                    .background(.white, in: Circle())
                    .shadow(color: .black.opacity(0.2), radius: 4)
            }
            .buttonStyle(PressableButtonStyle())
            .padding([.trailing, .bottom], sizeService.padding(for: dynamicTypeSize))
            .popoverTip(cameraTip)
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
