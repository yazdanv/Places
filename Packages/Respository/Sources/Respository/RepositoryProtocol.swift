//
//  RepositoryProtocol.swift
//
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation
import Network
import Caches

public protocol RepositoryProtocol {
    associatedtype NetworkServiceType: BaseNetworkServiceProtocol
    associatedtype CacheServiceType: BaseCacheServiceProtocol
    
    var networkService: NetworkServiceType { get }
    var cacheService: CacheServiceType { get }
}
