//
//  LocationProtocol.swift
//
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation

public protocol LocationProtocol {
    var name: String? { get }
    var lat: Double { get }
    var long: Double { get }
}

public protocol FromLocationEntityProtocol {
    static func fromEntity(_ entity: LocationProtocol) -> Self
}
