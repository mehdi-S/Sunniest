//
//  AppColors.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

struct AppColors {
    // MARK: - Constants
    private enum Constants {
        enum Light {
            static let top = Color(hex: 0xBCCEE5)
            static let middle = Color(hex: 0xA5C1E5)
            static let bottom = Color(hex: 0x609BE5)
        }

        enum Dark {
            static let top = Color(hex: 0x5A5A98)
            static let middle = Color(hex: 0x323164)
            static let bottom = Color(hex: 0x100F41)
        }
    }

    // MARK: - Color Palettes
    private static let lightColorPalette: [Color] = [
        Constants.Light.top,
        Constants.Light.middle,
        Constants.Light.bottom
    ]

    private static let darkColorPalette: [Color] = [
        Constants.Dark.top,
        Constants.Dark.middle,
        Constants.Dark.bottom
    ]

    // MARK: - Public Methods
    static func colorPalette(for scheme: ColorScheme) -> [Color] {
        scheme == .light ? lightColorPalette : darkColorPalette
    }
}
