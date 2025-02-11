//
//  PhotoCaptureView.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

import SwiftUI

struct PhotoCaptureView: View {
    @Environment(Router.self) private var router
    @State private var viewModel = PhotoCaptureViewModel()

    var body: some View {
        Text("cheese !")
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        PhotoCaptureView()
            .environment(Router())
    }
}
