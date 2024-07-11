//
//  DatabaseHandlerProtocol.swift
//
//
//  Created by Yazdan Vakili on 10/07/2024.
//

import Foundation

public protocol DatabaseHandlerProtocol {
    func save<T: Codable>(id: String, data: T)
    func get<T: Codable>(id: String) -> T?
}
