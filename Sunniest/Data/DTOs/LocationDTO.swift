//
//  LocationDTO.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

struct LocationDTO: Codable, Hashable, Identifiable {
    var id: Self { self }
    let name: String
    let actualTemp: String
    let weatherIcon: String

    static func preview() -> LocationDTO {
        LocationDTO(name: "Paris 5eme arrondissement",
                    actualTemp: "14°C",
                    weatherIcon: "cloud.rain.fill"
        )
    }
}
