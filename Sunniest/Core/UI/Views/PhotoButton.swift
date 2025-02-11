//
//  PhotoButton.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

// MARK: - View
struct PhotoButtonView: View {
    // MARK: - Environment
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    // MARK: - Dependencies
    private let sizeService = DynamicSizeService()

    // MARK: - Properties
    let action: @MainActor () -> Void

    // MARK: - Constants
    private enum Constants {
        static let shadowOpacity: CGFloat = 0.2
        static let shadowRadius: CGFloat = 4
        static let fontWeight: Font.Weight = .medium
    }

    // MARK: - Body
    var body: some View {
        Button(action: action) {
            buttonContent
        }
        .buttonStyle(PressableButtonStyle())
    }

    // MARK: - View Components
    private var buttonContent: some View {
        Image(systemName: "camera.circle.fill")
            .font(.system(
                size: sizeService.buttonSize(for: dynamicTypeSize),
                weight: Constants.fontWeight
            ))
            .foregroundStyle(.blue)
            .frame(
                width: sizeService.frameSize(for: dynamicTypeSize),
                height: sizeService.frameSize(for: dynamicTypeSize)
            )
            .background(.white, in: Circle())
            .shadow(
                color: .black.opacity(Constants.shadowOpacity),
                radius: Constants.shadowRadius
            )
    }
}

// MARK: - Preview
#Preview {
    PhotoButtonView {
        print("Tapped!")
    }
}
