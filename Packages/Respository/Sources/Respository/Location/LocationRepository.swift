//
//  LocationRepository.swift
//  
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation
import Combine
import Models
import Caches
import Network

public struct LocationRepository<NetworkServiceType: LocationNetworkProtocol, CacheServiceType: LocationDBProtocol>: LocationRepositoryProtocol {
    public var networkService: NetworkServiceType
    public var cacheService: CacheServiceType
    
    
    public init(
        networkService: NetworkServiceType = LocationNetworkService(),
        cacheService: CacheServiceType = LocationDBHandler()
    ) {
        self.networkService = networkService
        self.cacheService = cacheService
    }
    
    public func fetchLocation() -> AnyPublisher<any LocationsProtocol, Error>? {
       // if locations exist in the cache return the cache, if not call network
        if let locations = cacheService.getLocations() {
            return Just(locations)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } else if let networkPublisher = networkService.getLocations() {
            return networkPublisher.map { locations in
                self.cacheService.setLocations(locations)
                return locations
            }.eraseToAnyPublisher()
        }
        return nil
    }
    
}
