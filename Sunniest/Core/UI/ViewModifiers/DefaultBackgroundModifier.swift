//
//  DefaultBackgroundModifier.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

// MARK: - View Modifier
struct DefaultBackgroundModifier: ViewModifier {
    // MARK: - Environment
    @Environment(\.colorScheme) var colorScheme

    // MARK: - Body
    func body(content: Content) -> some View {
        ZStack {
            Rectangle().fill(
                LinearGradient(
                    colors: AppColors.colorPalette(for: colorScheme),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .ignoresSafeArea()

            content
                .background(Color(.clear))
                .scrollContentBackground(.hidden)
        }
    }
}

// MARK: - View Extension
extension View {
    func defaultBackground() -> some View {
        modifier(DefaultBackgroundModifier())
    }
}
