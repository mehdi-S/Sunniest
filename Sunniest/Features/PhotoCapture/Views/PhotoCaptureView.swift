//
//  PhotoCaptureView.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

struct PhotoCaptureView: View {
    @Environment(Router.self) private var router
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    @State private var viewModel = PhotoCaptureViewModel()
    @State private var overlayOpacity = 1.0
    private let sizeService = DynamicSizeService()

    struct Constants {
        static let horizontalPadding: CGFloat = 20
        static let verticalPadding: CGFloat = 20
        static let cornerRadius: CGFloat = 12
        static let fadeTransitionDuration: Double = 0.3
        static let displayDuration: Double = 2
    }

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

    @ViewBuilder
    private var imageContainer: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .fill(Color.white)
                .aspectRatio(3/4, contentMode: .fit)
                .padding(.horizontal, Constants.horizontalPadding)
            Image("picture1")
                .resizable()
                .cornerRadius(Constants.cornerRadius)
                .aspectRatio(3/4, contentMode: .fit)
                .padding(.horizontal, Constants.horizontalPadding + 6)
                .shadow(radius: 5)
            Image("photoTuto")
                .resizable()
                .cornerRadius(Constants.cornerRadius)
                .aspectRatio(3/4, contentMode: .fit)
                .padding(.horizontal, Constants.horizontalPadding + 6)
                .opacity(overlayOpacity)
        }.onAppear {
            withAnimation(
                .easeInOut(duration: Constants.fadeTransitionDuration)
                .delay(Constants.displayDuration)) {
                    overlayOpacity = 0
                }
        }
    }

    @ViewBuilder
    private var captureButton: some View {
        PhotoButtonView {
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
