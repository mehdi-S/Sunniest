//
//  SearchLocationVM.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

@Observable
@MainActor
final class SearchLocationViewModel {
    var router = Router()
    var countries = [LocationDTO]()
    private let viewFactory: AppViewFactory

    init(viewFactory: AppViewFactory = AppViewFactory()) {
        self.viewFactory = viewFactory
        countries = getLocations()
    }

    func getLocations() -> [LocationDTO] {
        return (1...20).map { index in
            let temp = Int.random(in: 0...22)
            let suffix = index == 1 ? "er" : "eme"
            return LocationDTO(name: "Paris \(index)\(suffix) arrondissement",
                               actualTemp: "\(String(temp))°C",
                               weatherIcon: getIconFromTemperature(temp))
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

    func filteredCountries(searchText: String) ->[LocationDTO] {
         guard !searchText.isEmpty else { return countries }
         return countries.filter { country in
             country.name.localizedCaseInsensitiveContains(searchText)
         }
     }

    func navigateToLocationFeed(country: LocationDTO) {
        // add business logic here before navigation
        router.navigate(to: .locationFeed(country: country))
    }

    func makeViewFromFactory(for route: Route) -> some View {
        viewFactory.makeView(for: route)
    }
}
