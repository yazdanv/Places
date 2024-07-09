//
//  LocationsNetworkModel.swift
//
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation
import Models

public struct LocationsNetworkModel: LocationsProtocol, Codable {
    
    public typealias LocationItem = LocationNetworkModel
    
    public var locations: [LocationItem]
}
