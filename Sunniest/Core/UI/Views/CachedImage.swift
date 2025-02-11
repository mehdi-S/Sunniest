//
//  CachedImage.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

struct CachedImage: View {
    let url: URL

    @State private var imageState: ImageState = .loading

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

    private func loadImage() async {
        // Try cache first
        if let cached = await ImageCache.shared.get(url) {
            imageState = .success(cached)
            return
        }

        // If not cached, load from network
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let uiImage = UIImage(data: data) {
                let image = Image(uiImage: uiImage)
                await ImageCache.shared.insert(image, for: url)
                imageState = .success(image)
            } else {
                imageState = .failure(URLError(.badServerResponse))
            }
        } catch {
            imageState = .failure(error)
        }
    }
}
