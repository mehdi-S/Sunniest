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
    // Public router for SwiftUI binding access
    var router = Router()
    var countries = [LocationDTO]()
    private let viewFactory: AppViewFactory

    init(viewFactory: AppViewFactory = AppViewFactory()) {
        self.viewFactory = viewFactory
        countries = [LocationDTO(id: 0, name: "Paris 5eme arrondissement")]
    }

    func filteredCountries(searchText: String) ->[LocationDTO] {
         guard !searchText.isEmpty else { return countries }
         return countries.filter { country in
             country.name.localizedCaseInsensitiveContains(searchText)
         }
     }

    // Navigation is controlled through specific methods
    func navigateToLocationFeed(country: LocationDTO) {
        // We can add business logic here before navigation
        router.navigate(to: .locationFeed(country: country))
    }

    func makeViewFromFactory(for route: Route) -> some View {
        viewFactory.makeView(for: route)
    }
}
