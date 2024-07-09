//
//  LocationNetworkModel.swift
//
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation
import Models

public struct LocationNetworkModel: LocationProtocol, Codable {
    public var name: String?
    public var lat: Double
    public var long: Double
}
