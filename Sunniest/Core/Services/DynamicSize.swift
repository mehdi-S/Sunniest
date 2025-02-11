//
//  DynamicSize.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

struct DynamicSizeService: DynamicSizeProtocol {
    func buttonSize(for dynamicTypeSize: DynamicTypeSize) -> CGFloat {
        switch dynamicTypeSize {
        case .xSmall, .small, .medium:
            return 70
        case .large:
            return 80
        case .xLarge, .xxLarge:
            return 90
        case .xxxLarge, .accessibility1, .accessibility2, .accessibility3, .accessibility4, .accessibility5:
            return 100
        @unknown default:
            return 80
        }
    }

    func frameSize(for dynamicTypeSize: DynamicTypeSize) -> CGFloat {
        switch dynamicTypeSize {
        case .xSmall, .small, .medium:
            return 78
        case .large:
            return 88
        case .xLarge, .xxLarge:
            return 98
        case .xxxLarge, .accessibility1, .accessibility2, .accessibility3, .accessibility4, .accessibility5:
            return 108
        @unknown default:
            return 88
        }
    }

    func padding(for dynamicTypeSize: DynamicTypeSize) -> CGFloat {
        switch dynamicTypeSize {
        case .xSmall, .small, .medium:
            return 16
        case .large, .xLarge, .xxLarge:
            return 20
        case .xxxLarge, .accessibility1, .accessibility2, .accessibility3, .accessibility4, .accessibility5:
            return 24
        @unknown default:
            return 16
        }
    }
}
