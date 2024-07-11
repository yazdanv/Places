//
//  File.swift
//  
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation
import Combine

public protocol NetworkServiceProtocol {
    func getRequest<T: Codable>(url: URL?) -> AnyPublisher<T, Error>?
}
