//
//  DefaultUrlOpenHandler.swift
//  Places
//
//  Created by Yazdan Vakili on 09/07/2024.
//

import Foundation
import UIKit

struct DefaultUrlOpenHandler: UrlOpenHandler {
    func open(url: URL) {
        UIApplication.shared.open(url)
    }
    
    func open(url: String) {
        guard let url = URL(string: url) else { return }
        open(url: url)
    }
    
    func openWikipediaLocation(lat: Double, long: Double) {
        let urlString = String(format: Constants.wikipediaUrlFormat.rawValue, lat, long)
        open(url: urlString)
    }
}
