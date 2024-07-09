//
//  RepositoryProtocol.swift
//
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation
import Network

public protocol RepositoryProtocol {
    associatedtype NetworkServiceType: NetworkServiceProtocol
    
    var networkService: NetworkServiceType { get }
}
