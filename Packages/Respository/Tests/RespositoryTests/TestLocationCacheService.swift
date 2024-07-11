//
//  TestLocationCacheService.swift
//
//
//  Created by Yazdan Vakili on 11/07/2024.
//

import Foundation
import Models
import Caches

final class TestLocationCacheService: LocationDBProtocol {
    internal let databaseHandler: any Caches.DatabaseHandlerProtocol = DefaultDatabaseHandler()
    
        
    var locations: (any LocationsProtocol)?
        
    init(locations: (any LocationsProtocol)? = nil) {
        self.locations = locations
    }
    
    func getLocations() -> (any LocationsProtocol)? {
        return locations
    }
    
    func setLocations(_ locations: any LocationsProtocol) {
        self.locations = locations
    }
}
