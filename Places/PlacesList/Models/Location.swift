//
//  Location.swift
//
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation
import Models

public struct Location: LocationProtocol {
    public let name: String?
    public let lat: Double
    public let long: Double
}

extension Location: FromLocationEntityProtocol {
    public static func fromEntity(_ entity: LocationProtocol) -> Location {
        return Location(name: entity.name, lat: entity.lat, long: entity.long)
    }
}

extension Location {
    var id: String {
        return "\(lat)\(long)"
    }
}
