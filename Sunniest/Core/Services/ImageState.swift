//
//  ImageState.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

enum ImageState {
    case loading
    case success(Image)
    case failure(Error)
}
