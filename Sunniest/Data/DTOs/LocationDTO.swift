//
//  LocationDTO.swift
//  Sunniest
//
//  Created by Mehdi Silini on 11/02/2025.
//

// MARK: - Model
struct LocationDTO: Codable, Hashable, Identifiable {
    // MARK: - Identifiable
    var id: Self { self }
    // MARK: - Properties
    let name: String
    let actualTemp: String
    let weatherIcon: String

    // MARK: - Preview Helper
    static func preview() -> LocationDTO {
        LocationDTO(name: "Paris 5eme arrondissement",
                    actualTemp: "14°C",
                    weatherIcon: "cloud.rain.fill"
        )
    }
}
