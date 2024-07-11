//
//  PlacesListItemViewModel.swift
//  Places
//
//  Created by Yazdan Vakili on 10/07/2024.
//

import Foundation

struct PlacesListItemViewModel {
    
    let location: Location?
    private let urlOpenHandler: any UrlOpenHandler
    
    var id: String {
        return location?.id ?? "default_id"
    }
    
    init(
        location: Location? = nil,
        urlOpenHandler: any UrlOpenHandler = DefaultUrlOpenHandler()
    ) {
        self.location = location
        self.urlOpenHandler = urlOpenHandler
    }
    
    func getUserPlaceViewModel() -> UserPlaceViewModel {
        return UserPlaceViewModel(urlOpenHandler: urlOpenHandler)
    }
    
    func clickOnLocation() {
        guard let location = location else { return }
        urlOpenHandler.openWikipediaLocation(lat: location.lat, long: location.long)
    }
}
