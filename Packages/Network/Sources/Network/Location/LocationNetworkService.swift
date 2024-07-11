//
//  File.swift
//  
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation
import Combine
import Models

public struct LocationNetworkService: LocationNetworkProtocol {
    public var urlProvider: any UrlProvider
    public var networkService: any NetworkServiceProtocol
    
    
    public init(networkService: NetworkServiceProtocol = DefaultNetworkService(), urlProvider: UrlProvider = DefaultUrlProvider()) {
        self.urlProvider = urlProvider
        self.networkService = networkService
    }
    
    public func getLocations() -> AnyPublisher<any LocationsProtocol, Error>? {
        guard let publisher: AnyPublisher<LocationsNetworkModel, Error> = 
                networkService.getRequest(url: urlProvider.fullUrl(.locations)) else { return nil }
        return publisher
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
}
