//
//  Location.swift
//
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation
import Models

public struct Location: LocationProtocol {
    public var name: String?
    public var lat: Double
    public var long: Double
}

extension Location {
    public static func fromEntity(_ entity: LocationProtocol) -> Location {
        return Location(name: entity.name, lat: entity.lat, long: entity.long)
    }
}
