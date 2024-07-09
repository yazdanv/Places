//
//  PlacesListViewModel.swift
//  Places
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation
import Combine
import Models
import Repository

class PlacesListViewModel: ObservableObject {
    @Published var locations: [LocationProtocol] = []
    
    let locationRepository: any LocationRepositoryProtocol
    let urlOpenHandler: any UrlOpenHandler
    
    var cancellables: Set<AnyCancellable> = []
    
    init(
        locationRepository: any LocationRepositoryProtocol = LocationRepository(),
        urlOpenHandler: any UrlOpenHandler = DefaultUrlOpenHandler()
    ) {
        self.locationRepository = locationRepository
        self.urlOpenHandler = urlOpenHandler
    }
    
    func fetchLocations() {
        locationRepository.fetchLocation()?.sink(receiveCompletion: {
            print($0)
        }, receiveValue: { [weak self] locations in
            self?.locations = locations.locations
        }).store(in: &cancellables)
    }
    
    func clickOnLocation(location: LocationProtocol) {
        urlOpenHandler.openWikipediaLocation(lat: location.lat, long: location.long)
    }
}
