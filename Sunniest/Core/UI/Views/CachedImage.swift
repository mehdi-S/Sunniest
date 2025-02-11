//
//  CachedImage.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

// MARK: - View
struct CachedImage: View {
    // MARK: - Properties
    let imageDisplayable: ImageDisplayable

    // MARK: - State
    @State private var imageState: ImageState = .loading

    // MARK: - Constants
    private enum Constants {
        static let placeholderOpacity: CGFloat = 0.1
        static let placeholderColor: Color = .gray
    }

    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                switch imageState {
                case .loading:
                    placeholderView
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                case .failure:
                    errorView
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .task {
            await loadImage()
        }
    }

    // MARK: - View Components
    private var placeholderView: some View {
        ZStack {
            Color.gray.opacity(0.1)
            ProgressView()
        }
    }

    private var errorView: some View {
        ZStack {
            Color.gray.opacity(0.1)
            Image(systemName: "photo.badge.exclamationmark")
                .foregroundStyle(.gray)
        }
    }

    // MARK: - Private Methods
    private func loadImage() async {
        // Try cache first
        if let cached = await ImageCache.shared.get(imageDisplayable.imageURL) {
            imageState = .success(cached)
            return
        }

        // If not cached, load from network
        do {
            switch imageDisplayable.value {
            case .async(let networkId):
                guard let unwrappedURL = URL(string: networkId) else {
                    imageState = .failure(URLError(.badURL))
                    return
                }
                let (data, _) = try await URLSession.shared.data(from: unwrappedURL)
                if let uiImage = UIImage(data: data) {
                    let image = Image(uiImage: uiImage)
                    await ImageCache.shared.insert(image, for: networkId)
                    imageState = .success(image)
                } else {
                    imageState = .failure(URLError(.badServerResponse))
                }
            case .system(let systemId):
                let image = Image(systemId)
                await ImageCache.shared.insert(image, for: systemId)
                imageState = .success(image)
            }
        } catch {
            imageState = .failure(error)
        }
    }
}
