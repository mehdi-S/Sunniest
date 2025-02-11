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
        let country = LocationDTO.preview()

        // Then - Initial state
        #expect(router.path.count == 0)

        // When
        router.navigate(to: .locationFeed(location: country))

        // Then - After navigation
        #expect(router.path.count == 1)
    }

    @Test
    func testNavigateBack() async throws {
        // Given
        let router = Router()
        let country = LocationDTO.preview()

        // When
        router.navigate(to: .locationFeed(location: country))
        #expect(router.path.count == 1)
        router.navigateBack()

        // Then
        #expect(router.path.count == 0)
    }

    @Test
    func testNavigateToRoot() async throws {
        // Given
        let router = Router()
        let country = LocationDTO.preview()

        // When
        router.navigate(to: .locationFeed(location: country))
        router.navigate(to: .locationFeed(location: country))
        #expect(router.path.count == 2)

        router.navigateToRoot()

        // Then
        #expect(router.path.count == 0)
    }
}
