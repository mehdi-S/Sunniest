//
//  PlaceholderView.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

struct PlaceholderView: View {

    struct Constants {
        static let imageSize: CGFloat = 56
    }

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "globe")
                .font(.system(size: Constants.imageSize))
                .foregroundStyle(.secondary)

            Text("Select a country to view its feed")
                .font(.headline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .defaultBackground()
    }
}
