//
//  UrlOpenHandler.swift
//  Places
//
//  Created by Yazdan Vakili on 09/07/2024.
//

import Foundation

protocol UrlOpenHandler {
    func open(url: URL)
    func open(url: String)
    func openWikipediaLocation(lat: Double, long: Double)
}
