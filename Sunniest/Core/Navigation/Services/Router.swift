//
//  Router.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

@Observable
final class Router {
    // MARK: - Properties
    var path = NavigationPath()

    // MARK: - Private Methods
    private func appendToPath(_ route: Route) {
        path.append(route)
    }

    private func removeLastFromPath() {
        path.removeLast()
    }

    private func clearPath() {
        path.removeLast(path.count)
    }

    // MARK: - Public Methods
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
