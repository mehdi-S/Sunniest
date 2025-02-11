//
//  PlaceholderView.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

//
//  PlaceholderView.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

// MARK: - View
struct PlaceholderView: View {
    // MARK: - Constants
    private enum Constants {
        static let imageSize: CGFloat = 56
        static let stackSpacing: CGFloat = 16
    }

    // MARK: - Body
    var body: some View {
        VStack(spacing: Constants.stackSpacing) {
            placeholderImage
            instructionText
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .defaultBackground()
    }
}

// MARK: - View Components
private extension PlaceholderView {
    var placeholderImage: some View {
        Image(systemName: "globe")
            .font(.system(size: Constants.imageSize))
            .foregroundStyle(.secondary)
    }

    var instructionText: some View {
        Text("Select a location to view its feed")
            .font(.headline)
            .foregroundStyle(.secondary)
    }
}

// MARK: - Preview
#Preview {
    PlaceholderView()
}
