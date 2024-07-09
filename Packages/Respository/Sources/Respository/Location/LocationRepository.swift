//
//  LocationRepository.swift
//  
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation
import Combine
import Models
import Network

public struct LocationRepository<NetworkServiceType: LocationNetworkProtocol>: LocationRepositoryProtocol {
    public var networkService: NetworkServiceType
    
    
    public init(networkService: NetworkServiceType = LocationNetworkService()) {
        self.networkService = networkService
    }
    
    public func fetchLocation() -> AnyPublisher<any LocationsProtocol, Error>? {
        return networkService.getLocations()
    }
    
}
