//
//  TestLocationRepository.swift
//  PlacesTests
//
//  Created by Yazdan Vakili on 11/07/2024.
//

import Foundation
import Combine
import Models
import Network
import Caches
import Repository

struct TestLocationRepository<NetworkServiceType: LocationNetworkProtocol, CacheServiceType: LocationDBProtocol>: LocationRepositoryProtocol {
    
    let networkService: NetworkServiceType
    let cacheService: CacheServiceType
    
    let locations: (any LocationsProtocol)?
    
    init(locations: (any LocationsProtocol)? = nil, networkService: NetworkServiceType = LocationNetworkService(), cacheService: CacheServiceType = LocationDBHandler()) {
        self.locations = locations
        self.networkService = networkService
        self.cacheService = cacheService
    }
    
    func fetchLocation() -> AnyPublisher<any Models.LocationsProtocol, any Error>? {
        if let locations = locations {
            return Just(locations).setFailureType(to: Error.self).eraseToAnyPublisher()
        } else {
            return Fail(error: URLError(.badServerResponse)).eraseToAnyPublisher()
        }
    }
    
}
