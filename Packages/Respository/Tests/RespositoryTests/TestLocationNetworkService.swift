//
//  TestLocationNetworkService.swift
//
//
//  Created by Yazdan Vakili on 11/07/2024.
//

import Foundation
import Combine
import Models
import Network

struct TestLocationNetworkService: LocationNetworkProtocol {
    
    let urlProvider: any UrlProvider = DefaultUrlProvider()
    let networkService: any NetworkServiceProtocol = DefaultNetworkService()
    
    private let locations: (any LocationsProtocol)?
    
    init(locations: (any LocationsProtocol)? = nil) {
        self.locations = locations
    }
    
    func getLocations() -> AnyPublisher<any LocationsProtocol, Error>? {
        if let locations = locations {
            return Just(locations).setFailureType(to: Error.self).eraseToAnyPublisher()
        } else {
            return Fail(error: URLError(.badServerResponse)).eraseToAnyPublisher()
        }
    }
}

