//
//  PhotoButton.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

struct PhotoButtonView: View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    private let sizeService = DynamicSizeService()
    let action: @MainActor () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "camera.circle.fill")
                .font(.system(size: sizeService.buttonSize(for: dynamicTypeSize),
                              weight: .medium))
                .foregroundStyle(.blue)
                .frame(width: sizeService.frameSize(for: dynamicTypeSize),
                       height: sizeService.frameSize(for: dynamicTypeSize))
                .background(.white,
                            in: Circle())
                .shadow(color: .black.opacity(0.2), radius: 4)
        }
        .buttonStyle(PressableButtonStyle())
    }
}

#Preview {
    PhotoButtonView {
        print("Tapped!")
    }
}
