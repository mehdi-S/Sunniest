//
//  Router.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

@Observable
final class Router {
    var path = NavigationPath()

    private func appendToPath(_ route: Route) {
        path.append(route)
    }
    private func removeLastFromPath() {
        path.removeLast()
    }
    private func clearPath() {
        path.removeLast(path.count)
    }

    func navigate(to route: Route) {
        // add logging, analytics, or validation
        appendToPath(route)
    }
    func navigateBack() {
        // add checks or side effects before navigation
        guard !path.isEmpty else { return }
        removeLastFromPath()
    }
    func navigateToRoot() {
        // perform cleanup or trigger events
        clearPath()
    }
}
