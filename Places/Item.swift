//
//  Item.swift
//  Places
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
