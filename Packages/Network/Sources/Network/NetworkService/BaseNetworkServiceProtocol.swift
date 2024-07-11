//
//  BaseNetworkServiceProtocol.swift
//
//
//  Created by Yazdan Vakili on 09/07/2024.
//

import Foundation

public protocol BaseNetworkServiceProtocol {
    var urlProvider: UrlProvider { get }
    var networkService: NetworkServiceProtocol { get }
}
