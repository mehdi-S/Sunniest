//
//  DynamicSizeProtocol.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

protocol DynamicSizeProtocol {
    func buttonSize(for dynamicTypeSize: DynamicTypeSize) -> CGFloat
    func frameSize(for dynamicTypeSize: DynamicTypeSize) -> CGFloat
    func padding(for dynamicTypeSize: DynamicTypeSize) -> CGFloat
}
