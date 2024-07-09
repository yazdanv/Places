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
    
    
    public init(urlProvider: UrlProvider = DefaultUrlProvider()) {
        self.urlProvider = urlProvider
    }
    
    public func getLocations() -> AnyPublisher<any LocationsProtocol, Error>? {
        guard let publisher: AnyPublisher<LocationsNetworkModel, Error> = 
                getRequest(url: urlProvider.fullUrl(.locations)) else { return nil }
        return publisher
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
}
