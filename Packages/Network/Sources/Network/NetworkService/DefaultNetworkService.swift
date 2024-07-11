//
//  DefaultNetworkService.swift
//  
//
//  Created by Yazdan Vakili on 09/07/2024.
//

import Foundation
import Combine

public struct DefaultNetworkService: NetworkServiceProtocol {
    public init() {}
    
    public func getRequest<T: Codable>(url: URL?) -> AnyPublisher<T, Error>? {
        guard let url = url else { return nil }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
