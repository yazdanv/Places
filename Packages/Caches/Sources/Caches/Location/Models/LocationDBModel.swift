//
//  LocationDBModel.swift
//
//
//  Created by Yazdan Vakili on 10/07/2024.
//

import Foundation
import Models

struct LocationDBModel: Codable, LocationProtocol  {
    let name: String?
    let lat: Double
    let long: Double
}

extension LocationDBModel: FromLocationEntityProtocol {
    static func fromEntity(_ entity: LocationProtocol) -> LocationDBModel {
        return LocationDBModel(name: entity.name, lat: entity.lat, long: entity.long)
    }
}
