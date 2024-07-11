//
//  TestNetworkService.swift
//
//
//  Created by Yazdan Vakili on 09/07/2024.
//

import Foundation
import Combine
import Network

struct TestNetworkService<ObjectType: Codable>: NetworkServiceProtocol {
    
    private let object: ObjectType?
    
    public init(object: ObjectType? = nil) {
        self.object = object
    }
    
    func getRequest<T: Codable>(url: URL?) -> AnyPublisher<T, any Error>? {
        // return based on the shouldSucceed value
        if let object = object as? T {
            return Just(object).setFailureType(to: Error.self).eraseToAnyPublisher()
        } else {
            return Fail(error: URLError(.badServerResponse)).eraseToAnyPublisher()
        }
    }
    
}
