//
//  File.swift
//  
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation
import Combine

public protocol NetworkServiceProtocol {
    var urlProvider: UrlProvider { get }
    
    func getRequest<T: Codable>(url: URL?) -> AnyPublisher<T, Error>?
}

extension NetworkServiceProtocol {
    
    public func getRequest<T: Codable>(url: URL?) -> AnyPublisher<T, Error>? {
        guard let url = url else { return nil }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
