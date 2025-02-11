import SwiftUI

// MARK: - View
struct SearchLocationView: View {
    // MARK: - Environment
    @Environment(\.colorScheme) var colorScheme

    // MARK: - State Properties
    @State private var viewModel = SearchLocationViewModel()
    @State private var searchText = ""
    @State private var selectedLocation: LocationDTO?

    // MARK: - Constants
    private enum ViewConstants {
        static let weatherIconSize: CGFloat = 20
    }

    // MARK: - Body
    var body: some View {
        NavigationSplitView {
            locationList
        } detail: {
            locationDetail
        }
        .environment(viewModel.router)
    }
}

// MARK: - View Components
private extension SearchLocationView {
    var locationList: some View {
        List(viewModel.filteredCountries(searchText: searchText),
             selection: $selectedLocation) { location in
            locationRow(location)
        }
        .navigationTitle("Prefered Locations")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer,
            prompt: "Search countries"
        )
        .defaultBackground()
    }

    var locationDetail: some View {
        NavigationStack(path: $viewModel.router.path) {
            if let location = selectedLocation {
                LocationFeedView(viewModel: LocationFeedViewModel(location: location))
            } else {
                PlaceholderView()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    func locationRow(_ location: LocationDTO) -> some View {
        HStack {
            Text("\(location.name)")
            Spacer()
            weatherInformationView(location)
                .fixedSize()
        }
        .tag(location)
    }

    func weatherInformationView(_ location: LocationDTO) -> some View {
        VStack(alignment: .trailing) {
            Image(systemName: location.weatherIcon)
                .symbolRenderingMode(.palette)
                .weatherForegroundStyle(isSunny: location.weatherIcon.contains("sun"))
                .font(.system(size: ViewConstants.weatherIconSize))
                .frame(width: ViewConstants.weatherIconSize,
                       height: ViewConstants.weatherIconSize)
            Text("\(location.actualTemp)")
        }
    }
}

// MARK: - Preview
#Preview {
    SearchLocationView()
}
