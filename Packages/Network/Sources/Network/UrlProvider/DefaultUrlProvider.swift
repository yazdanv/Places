//
//  DefaultUrlProvider.swift
//
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation

public struct DefaultUrlProvider: UrlProvider {
    
    public init() {}
    
    public func fullUrl(_ path: UrlPath) -> URL? {
        return url(path: path, baseUrl: UrlPath.baseUrl.rawValue)
    }

    public func url(path: UrlPath, baseUrl: String) -> URL? {
        return URL(string: baseUrl + path.rawValue)
    }
    
}


