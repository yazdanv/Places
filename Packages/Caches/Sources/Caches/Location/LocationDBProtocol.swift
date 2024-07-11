//
//  LocationDBProtocol.swift
//
//
//  Created by Yazdan Vakili on 10/07/2024.
//

import Foundation
import Models

public protocol LocationDBProtocol: BaseCacheServiceProtocol {
    func getLocations() -> (any LocationsProtocol)?
    func setLocations(_ locations: any LocationsProtocol)
}
