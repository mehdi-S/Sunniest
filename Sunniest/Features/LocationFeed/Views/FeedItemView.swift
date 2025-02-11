//
//  FeedItemView.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

struct FeedItemView: View {
    struct Constants {
        static let imageHeight: CGFloat = 300
        static let cornerRadius: CGFloat = 12
        static let shadowRadius: CGFloat = 5
        static let spacing: CGFloat = 8
    }
    let item: FeedItem

    var body: some View {
        VStack(alignment: .leading, spacing: Constants.spacing) {
            imageSection
            descriptionSection
        }
        .background(Color(.systemBackground))
        .cornerRadius(Constants.cornerRadius)
        .shadow(radius: Constants.shadowRadius)
        .padding(.horizontal)
    }

    private var imageSection: some View {
        CachedImage(url: item.imageURL)
            .frame(height: Constants.imageHeight)
            .clipped()
    }

    private var descriptionSection: some View {
        Text(item.description)
            .padding(.horizontal)
            .padding(.bottom)
    }
}

#Preview {
    FeedItemView(item: FeedItem(
        imageURL: URL(string: "https://picsum.photos/400/300")!,
        description: "A beautiful landscape"
    ))
}
