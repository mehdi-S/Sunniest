import SwiftUI

// MARK: - View
struct LocationFeedView: View {
    // MARK: - Environment
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    @Environment(Router.self) private var router
    
    // MARK: - State Properties
    @State private var viewModel: LocationFeedViewModel
    
    // MARK: - Dependencies
    private let sizeService = DynamicSizeService()
    private let photoCaptureManager = PhotoCaptureManager.shared
    private var cameraTip = CameraButtonTip()
    
    // MARK: - Constants
    private enum Constants {
        static let verticalSpacing: CGFloat = 20
    }
    
    // MARK: - Initialization
    init(viewModel: LocationFeedViewModel) {
        _viewModel = State(initialValue: viewModel)
    }
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            contentSection
        }
        .overlay(alignment: .bottomTrailing) {
            PhotoButtonView {
                CameraButtonTip.buttonWasTapped.toggle()
                router.navigate(to: .photoCapture)
            }
            .popoverTip(cameraTip)
            .padding(.trailing, sizeService.padding(for: dynamicTypeSize))
        }
        .onChange(of: photoCaptureManager.capturedImageFeedItemRepresentation) { oldValue, newValue in
            if let bundleID = newValue {
                viewModel.handleCapturedPhoto(bundleID)
                photoCaptureManager.capturedImageFeedItemRepresentation = nil
            }
        }
        .navigationDestination(for: Route.self) { route in
            viewModel.makeViewForRoute(route)
        }
        .defaultBackground()
        .navigationTitle(viewModel.location.name)
    }
    
    // MARK: - View Components
    private var contentSection: some View {
        LazyVStack(spacing: Constants.verticalSpacing) {
            ForEach(viewModel.items) { item in
                FeedItemView(item: item)
            }
        }
        .padding(.vertical)
    }
}

// MARK: - Preview
#Preview("Feed") {
    NavigationStack {
        LocationFeedView(viewModel: LocationFeedViewModel(location: LocationDTO.preview()))
    }
    .environment(Router())
}
