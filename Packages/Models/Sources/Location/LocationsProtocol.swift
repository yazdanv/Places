//
//  LocationsProtocol.swift
//
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation

public protocol LocationsProtocol {
    associatedtype LocationItem: LocationProtocol
    var locations: [LocationItem] { get }
}

public protocol FromLocationsEntityProtocol {
    static func fromEntity(_ entity: any LocationsProtocol) -> Self
}
