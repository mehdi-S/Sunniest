//
//  AppColors.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

struct AppColors {
    private static let lightColorPalette: [Color] = [Color(hex: 0xBCCEE5),
                                                     Color(hex: 0xA5C1E5),
                                                     Color(hex: 0x609BE5)]
    private static let darkColorPalette: [Color] = [Color(hex: 0x5A5A98),
                                                     Color(hex: 0x323164),
                                                     Color(hex: 0x100F41)]
    static func colorPalette(for scheme: ColorScheme) -> [Color] {
        scheme == .light ? lightColorPalette : darkColorPalette
    }
}
