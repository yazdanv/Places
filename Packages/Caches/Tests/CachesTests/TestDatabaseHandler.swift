//
//  File.swift
//  
//
//  Created by Yazdan Vakili on 11/07/2024.
//

import Foundation
import Caches

final class TestDatabaseHandler: DatabaseHandlerProtocol {
        
    private var defaultData: Codable?
    
    public init(defaultData: Codable? = nil) {
        self.defaultData = defaultData
    }
    
    public func save<T: Codable>(id: String, data: T) {
        defaultData = data
    }
    
    public func get<T: Codable>(id: String) -> T? {
        return defaultData as? T
    }
}
