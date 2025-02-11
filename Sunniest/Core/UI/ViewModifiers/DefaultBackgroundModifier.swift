//
//  DefaultBackgroundModifier.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

struct DefaultBackgroundModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        ZStack {
            Rectangle().fill(
                LinearGradient(colors: AppColors.colorPalette(for: colorScheme),
                               startPoint: .top,
                               endPoint: .bottom)
            )
            .ignoresSafeArea()
            content
                .background(Color(.clear))
                .scrollContentBackground(.hidden)
        }
    }
}

extension View {
    func defaultBackground() -> some View {
        modifier(DefaultBackgroundModifier())
    }
}
