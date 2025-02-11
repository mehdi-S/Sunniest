//
//  Route.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import Foundation
import SwiftUI

enum Route: Hashable {
    case locationFeed(country: LocationDTO)
    case photoCapture
}
