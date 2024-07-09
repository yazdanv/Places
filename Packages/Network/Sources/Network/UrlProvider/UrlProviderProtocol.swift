//
//  UrlProviderProtocol.swift
//  
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation

public protocol UrlProvider {
    func fullUrl(_ path: UrlPath) -> URL?
    func url(path: UrlPath, baseUrl: String) -> URL?
}
