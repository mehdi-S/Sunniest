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
        }.overlay(alignment: .bottomTrailing) {
            Button(action: { }) {
                Image(systemName: "camera.circle.fill")
                    .font(.system(size: 80, weight: .medium))
                    .foregroundStyle(.blue)
                    .frame(width: 88, height: 88)
                    .background(.white, in: Circle())
                    .shadow(color: .black.opacity(0.2), radius: 4)
            }
            .buttonStyle(PressableButtonStyle())
            .padding([.trailing, .bottom], 16)
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
