//
//  LocationDBHandler.swift
//
//
//  Created by Yazdan Vakili on 10/07/2024.
//

import Foundation
import Models

public struct LocationDBHandler: LocationDBProtocol {
    public var databaseHandler: any DatabaseHandlerProtocol
    
    
    public init(databaseHandler: any DatabaseHandlerProtocol = DefaultDatabaseHandler()) {
        self.databaseHandler = databaseHandler
    }
    
    public func getLocations() -> (any LocationsProtocol)? {
        guard let locations: LocationsDBModel = databaseHandler.get(id: LocationsDBKeys.locations.rawValue) else { return nil }
        return locations.isValid ? locations:nil
    }
    
    public func setLocations(_ locations: any Models.LocationsProtocol) {
        let locationsDBModel = LocationsDBModel.fromEntity(locations)
        databaseHandler.save(id: LocationsDBKeys.locations.rawValue, data: locationsDBModel)
    }
    
}

fileprivate enum LocationsDBKeys: String {
    case locations = "locations"
}
