//
//  PhotoCaptureView.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

// MARK: - View
struct PhotoCaptureView: View {
    // MARK: - Environment
    @Environment(Router.self) private var router
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    // MARK: - State Properties
    @State private var viewModel = PhotoCaptureViewModel()
    @State private var overlayOpacity = 1.0

    // MARK: - Dependencies
    private let sizeService = DynamicSizeService()

    // MARK: - Constants
    private enum Constants {
        static let horizontalPadding: CGFloat = 20
        static let verticalPadding: CGFloat = 20
        static let cornerRadius: CGFloat = 12
        static let fadeTransitionDuration: Double = 0.3
        static let displayDuration: Double = 2
    }

    // MARK: - Body
    var body: some View {
        VStack {
            imageContainer
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .bottom) {
            captureButton
        }
        .defaultBackground()
    }

    // MARK: - View Components
    private var imageContainer: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .fill(Color.white)
                .aspectRatio(3/4, contentMode: .fit)
                .padding(.horizontal, Constants.horizontalPadding)
            portraitRatioImageView("picture1")
            portraitRatioImageView("photoTuto")
                .opacity(overlayOpacity)
        }
        .onAppear {
            withAnimation(
                .easeInOut(duration: Constants.fadeTransitionDuration)
                .delay(Constants.displayDuration)
            ) {
                overlayOpacity = 0
            }
        }
    }

    private var captureButton: some View {
        PhotoButtonView {
            viewModel.storeCapturedImage(FeedItem(
                image: ImageDisplayable(value: .system(systemId: "picture1")),
                takenAt: "0 seconds ago"
            ))
            router.navigateBack()
        }
    }

    private func portraitRatioImageView(_ outsourcedImage: String) -> some View {
        Image(outsourcedImage)
            .resizable()
            .cornerRadius(Constants.cornerRadius)
            .aspectRatio(3/4, contentMode: .fit)
            .padding(.horizontal, Constants.horizontalPadding + 6)
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        PhotoCaptureView()
    }
    .environment(Router())
}
