//
//  LocationsTestObject.swift
//
//
//  Created by Yazdan Vakili on 11/07/2024.
//

import Foundation
import Models

struct LocationsTestObject: LocationsProtocol {
    typealias LocationItem = LocationTestObject
    let locations: [LocationTestObject]
}

struct LocationTestObject: LocationProtocol {
    let name: String?
    let lat: Double
    let long: Double
}
