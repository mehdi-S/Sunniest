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
            imageSection.overlay(alignment: .bottomTrailing) {
                descriptionSection
                    .padding([.trailing,.bottom], Constants.spacing)
            }
        }
        .background(Color(.systemBackground))
        .cornerRadius(Constants.cornerRadius)
        .shadow(radius: Constants.shadowRadius)
        .padding(.horizontal)
    }

    private var imageSection: some View {
        CachedImage(imageDisplayable: item.image)
            .frame(height: Constants.imageHeight)
            .clipped()
    }

    private var descriptionSection: some View {
        Text(item.takenAt)
            .padding(8)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius))
    }
}

#Preview {
    FeedItemView(item: FeedItem(
        image: ImageDisplayable(value: .system(systemId: "picture1")),
        takenAt: "1 second ago"
    ))
}
