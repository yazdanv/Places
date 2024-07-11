//
//  File.swift
//  
//
//  Created by Yazdan Vakili on 10/07/2024.
//

import Foundation
import Models

struct LocationsDBModel: Codable, LocationsProtocol, BaseCacheProtocol  {
    
    typealias LocationItem = LocationDBModel
    
    let invalidationTime: TimeInterval
    let locations: [LocationItem]
    
    init(locations: [LocationItem], invalidationTimeoutSeconds: Int = 60) {
        self.locations = locations
        invalidationTime = Date().addingTimeInterval(TimeInterval(invalidationTimeoutSeconds)).timeIntervalSince1970
    }
}

extension LocationsDBModel: FromLocationsEntityProtocol {
    static func fromEntity(_ entity: any LocationsProtocol) -> LocationsDBModel {
        return LocationsDBModel(locations: entity.locations.map { LocationDBModel.fromEntity($0) })
    }
}
