//
//  BaseCacheProtocol.swift
//  
//
//  Created by Yazdan Vakili on 10/07/2024.
//

import Foundation

protocol BaseCacheProtocol {
    var invalidationTime: TimeInterval { get }
}

extension BaseCacheProtocol {
    
    var isValid: Bool {
        return Date().timeIntervalSince1970 < invalidationTime
    }
    
}
