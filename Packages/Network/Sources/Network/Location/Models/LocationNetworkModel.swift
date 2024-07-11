//
//  LocationNetworkModel.swift
//
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation
import Models

public struct LocationNetworkModel: LocationProtocol, Codable {
    public let name: String?
    public let lat: Double
    public let long: Double
}
