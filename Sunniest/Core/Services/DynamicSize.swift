//
//  DynamicSize.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

struct DynamicSizeService: DynamicSizeProtocol {
    // MARK: - Constants
    private enum Constants {
        enum ButtonSize {
            static let small: CGFloat = 70
            static let medium: CGFloat = 80
            static let large: CGFloat = 90
            static let extraLarge: CGFloat = 100
        }

        enum FrameSize {
            static let small: CGFloat = 78
            static let medium: CGFloat = 88
            static let large: CGFloat = 98
            static let extraLarge: CGFloat = 108
        }

        enum PaddingSize {
            static let small: CGFloat = 16
            static let medium: CGFloat = 20
            static let large: CGFloat = 24
        }
    }

    // MARK: - Public Methods
    func buttonSize(for dynamicTypeSize: DynamicTypeSize) -> CGFloat {
        switch dynamicTypeSize {
        case .xSmall, .small, .medium:
            return Constants.ButtonSize.small
        case .large:
            return Constants.ButtonSize.medium
        case .xLarge, .xxLarge:
            return Constants.ButtonSize.large
        case .xxxLarge, .accessibility1, .accessibility2, .accessibility3, .accessibility4, .accessibility5:
            return Constants.ButtonSize.extraLarge
        @unknown default:
            return Constants.ButtonSize.medium
        }
    }

    func frameSize(for dynamicTypeSize: DynamicTypeSize) -> CGFloat {
        switch dynamicTypeSize {
        case .xSmall, .small, .medium:
            return Constants.FrameSize.small
        case .large:
            return Constants.FrameSize.medium
        case .xLarge, .xxLarge:
            return Constants.FrameSize.large
        case .xxxLarge, .accessibility1, .accessibility2, .accessibility3, .accessibility4, .accessibility5:
            return Constants.FrameSize.extraLarge
        @unknown default:
            return Constants.FrameSize.medium
        }
    }

    func padding(for dynamicTypeSize: DynamicTypeSize) -> CGFloat {
        switch dynamicTypeSize {
        case .xSmall, .small, .medium:
            return Constants.PaddingSize.small
        case .large, .xLarge, .xxLarge:
            return Constants.PaddingSize.medium
        case .xxxLarge, .accessibility1, .accessibility2, .accessibility3, .accessibility4, .accessibility5:
            return Constants.PaddingSize.large
        @unknown default:
            return Constants.PaddingSize.small
        }
    }
}
