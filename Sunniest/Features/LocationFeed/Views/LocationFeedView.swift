//
//  LocationFeedView.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

struct LocationFeedView: View {
    @State private var viewModel: LocationFeedViewModel
        struct Constants {
            static let verticalSpacing: CGFloat = 20
        }

    init(viewModel: LocationFeedViewModel) {
            _viewModel = State(initialValue: viewModel)
        }

        var body: some View {
            ScrollView {
                contentSection
            }
            .defaultBackground()
            .navigationTitle("Feed")
        }

        private var contentSection: some View {
            LazyVStack(spacing: Constants.verticalSpacing) {
                ForEach(viewModel.items) { item in
                    FeedItemView(item: item)
                }
            }
            .padding(.vertical)
        }
    }

    #Preview("Feed") {
        NavigationStack {
            LocationFeedView(viewModel: LocationFeedViewModel(location: LocationDTO.preview()))
        }
    }
