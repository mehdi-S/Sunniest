//
//  LocationDTO.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

struct LocationDTO: Codable, Hashable, Identifiable {
    let id: Int
    let name: String

    static func preview() -> LocationDTO {
        LocationDTO(id: 0, name: "France")
    }
}
