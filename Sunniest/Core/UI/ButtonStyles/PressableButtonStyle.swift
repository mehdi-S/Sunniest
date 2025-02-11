//
//  PressableButtonStyle.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.spring(response: 0.2), value: configuration.isPressed)
    }
}
