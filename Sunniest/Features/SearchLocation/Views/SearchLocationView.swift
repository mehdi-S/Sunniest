//
//  SearchLocation.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

struct SearchLocationView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var viewModel = SearchLocationViewModel()
    @State private var searchText = ""
    @State private var selectedLocation: LocationDTO?

    var body: some View {
        NavigationSplitView {
            List(viewModel.filteredCountries(searchText: searchText), selection: $selectedLocation) { location in
                Text("\(location.name)")
                    .tag(location)
            }
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer,
                prompt: "Search countries"
            )
            .defaultBackground()
        } detail: {
            NavigationStack(path: $viewModel.router.path) {
                if let location = selectedLocation {
                    LocationFeedView(viewModel: LocationFeedViewModel(location: location))
                } else {
                    PlaceholderView()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .environment(viewModel.router)
    }
}

#Preview {
    SearchLocationView()
}
