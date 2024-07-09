//
//  Locations.swift
//
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation
import Models

public struct Locations: LocationsProtocol {
    public typealias LocationItem = Location
    
    public var locations: [LocationItem]
}

extension Locations {
    public static func fromEntity(_ entity: any LocationsProtocol) -> Locations {
        return Locations(locations: entity.locations.map { Location.fromEntity($0) })
    }
}
