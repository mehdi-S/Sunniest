//
//  PressableButtonStyle.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

// MARK: - Button Style
struct PressableButtonStyle: ButtonStyle {
    // MARK: - Constants
    private enum Constants {
        static let pressedScale: CGFloat = 0.95
        static let defaultScale: CGFloat = 1.0
        static let animationDuration: CGFloat = 0.2
    }

    // MARK: - Body
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? Constants.pressedScale : Constants.defaultScale)
            .animation(
                .spring(response: Constants.animationDuration),
                value: configuration.isPressed
            )
    }
}
