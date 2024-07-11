//
//  File.swift
//  
//
//  Created by Yazdan Vakili on 10/07/2024.
//

import Foundation

public struct DefaultDatabaseHandler: DatabaseHandlerProtocol {
        
    public init() {}
    
    public func save<T: Codable>(id: String, data: T) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(data) {
            UserDefaults.standard.set(encoded, forKey: id)
        }
    }
    
    public func get<T: Codable>(id: String) -> T? {
        if let data = UserDefaults.standard.data(forKey: id) {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(T.self, from: data) {
                return decoded
            }
        }
        return nil
    }
}
