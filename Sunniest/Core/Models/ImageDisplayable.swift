//
//  ImageDisplayable.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

struct ImageDisplayable: Identifiable, Hashable {
    var id: Self { self }
    var value: ImageType

    enum ImageType: Hashable {
        case async(networkId: String)
        case system(systemId: String)
    }

    var imageURL: String {
        switch value {
        case .async(let networkId):
            return networkId
        case .system(let systemId):
            return systemId
        }
    }
}
