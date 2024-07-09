//
//  Models.swift
//  Places
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation
import Models

extension LocationProtocol {
    var id: String {
        return "\(lat)\(long)"
    }
}
