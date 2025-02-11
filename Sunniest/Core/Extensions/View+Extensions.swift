//
//  View+Extensions.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

extension View {
    @ViewBuilder
    func weatherForegroundStyle(isSunny: Bool) -> some View {
        if isSunny {
            self.foregroundStyle(.gray, .yellow)
        } else {
            self.foregroundStyle(.gray,.blue)
        }
    }
}
