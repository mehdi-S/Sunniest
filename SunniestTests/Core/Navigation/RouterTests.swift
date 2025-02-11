//
//  SunniestTests.swift
//  SunniestTests
//
//  Created by Mehdi Silini on 11/02/2025.
//

import Testing
@testable import Sunniest

struct RouterTests {
    @Test
    func testNavigationPathUpdates() async throws {
        // Given
        let router = Router()
        let location = LocationDTO.preview()

        // Then - Initial state
        #expect(router.path.count == 0)

        // When
        router.navigate(to: .locationFeed(location: location))

        // Then - After navigation
        #expect(router.path.count == 1)
    }

    @Test
    func testNavigateBack() async throws {
        // Given
        let router = Router()
        let location = LocationDTO.preview()

        // When
        router.navigate(to: .locationFeed(location: location))
        #expect(router.path.count == 1)
        router.navigateBack()

        // Then
        #expect(router.path.count == 0)
    }

    @Test
    func testNavigateToRoot() async throws {
        // Given
        let router = Router()
        let location = LocationDTO.preview()

        // When
        router.navigate(to: .locationFeed(location: location))
        router.navigate(to: .locationFeed(location: location))
        #expect(router.path.count == 2)

        router.navigateToRoot()

        // Then
        #expect(router.path.count == 0)
    }
}
