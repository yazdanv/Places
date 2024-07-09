//
//  LocationRepositoryProtocol.swift
//  
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation
import Combine
import Models

public protocol LocationRepositoryProtocol: RepositoryProtocol {
    func fetchLocation() -> AnyPublisher<any LocationsProtocol, Error>?
}
