//
//  LocationNetworkModel.swift
//
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation
import Combine
import Models

public protocol LocationNetworkProtocol: NetworkServiceProtocol {
    
    func getLocations() -> AnyPublisher<any LocationsProtocol, Error>?
    
}