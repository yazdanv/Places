//
//  PlacesListItemViewModel.swift
//  Places
//
//  Created by Yazdan Vakili on 10/07/2024.
//

import Foundation

struct PlacesListItemViewModel {
    
    let location: Location
    private let urlOpenHandler: any UrlOpenHandler
    
    init(
        location: Location,
        urlOpenHandler: any UrlOpenHandler = DefaultUrlOpenHandler()
    ) {
        self.location = location
        self.urlOpenHandler = urlOpenHandler
    }
    
    func clickOnLocation() {
        urlOpenHandler.openWikipediaLocation(lat: location.lat, long: location.long)
    }
}
