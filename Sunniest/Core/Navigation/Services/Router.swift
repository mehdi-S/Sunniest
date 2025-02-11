//
//  Router.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

@Observable
final class Router {
    // Internal path that SwiftUI can bind to
    var path = NavigationPath()

    // Private methods for navigation control
    private func appendToPath(_ route: Route) {
        path.append(route)
    }
    private func removeLastFromPath() {
        path.removeLast()
    }
    private func clearPath() {
        path.removeLast(path.count)
    }

    // Public interface that controls how navigation can be performed
    func navigate(to route: Route) {
        // Here we could add logging, analytics, or validation
        appendToPath(route)
    }
    func navigateBack() {
        // Here we could add checks or side effects before navigation
        guard !path.isEmpty else { return }
        removeLastFromPath()
    }
    func navigateToRoot() {
        // Here we could perform cleanup or trigger events
        clearPath()
    }
}
