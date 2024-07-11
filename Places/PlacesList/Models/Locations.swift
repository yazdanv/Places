//
//  Locations.swift
//
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation
import Models

struct Locations: LocationsProtocol {
    typealias LocationItem = Location
    
    let locations: [LocationItem]
}

extension Locations: FromLocationsEntityProtocol {
    static func fromEntity(_ entity: any LocationsProtocol) -> Locations {
        return Locations(locations: entity.locations.map { Location.fromEntity($0) })
    }
}
