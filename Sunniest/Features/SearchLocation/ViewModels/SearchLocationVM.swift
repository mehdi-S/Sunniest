//
//  SearchLocationVM.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

// MARK: - ViewModel
@Observable
@MainActor
final class SearchLocationViewModel {
    // MARK: - Properties
    var router = Router()
    var Locations = [LocationDTO]()
    private let viewFactory: AppViewFactory

    // MARK: - Initialization
    init(viewFactory: AppViewFactory = AppViewFactory()) {
        self.viewFactory = viewFactory
        Locations = getLocations()
    }

    // MARK: - Methods
    func getLocations() -> [LocationDTO] {
        return (1...20).map { index in
            let temp = Int.random(in: 0...22)
            let suffix = index == 1 ? "er" : "eme"
            return LocationDTO(
                name: "Paris \(index)\(suffix) arrondissement",
                actualTemp: "\(String(temp))°C",
                weatherIcon: getIconFromTemperature(temp)
            )
        }
    }

    func getIconFromTemperature(_ temperature: Int) -> String {
        switch temperature {
        case 0...5:
            return "cloud.rain.fill"
        case 6...15:
            return "smoke.fill"
        case 16...22:
            return "cloud.sun.fill"
        default:
            return "sun.max.fill"
        }
    }

    func filteredLocations(searchText: String) -> [LocationDTO] {
        guard !searchText.isEmpty else { return Locations }
        return Locations.filter { location in
            location.name.localizedCaseInsensitiveContains(searchText)
        }
    }

    func navigateToLocationFeed(with location: LocationDTO) {
        // add business logic here before navigation
        router.navigate(to: .locationFeed(location: location))
    }

    func makeViewFromFactory(for route: Route) -> some View {
        viewFactory.makeView(for: route)
    }
}
