//
//  PlacesListViewModel.swift
//  Places
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import Foundation
import Combine
import Repository

class PlacesListViewModel: ObservableObject {
    @Published var itemViewModels: [PlacesListItemViewModel] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    private let locationRepository: any LocationRepositoryProtocol
    private let urlOpenHandler: any UrlOpenHandler
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(
        locationRepository: any LocationRepositoryProtocol = LocationRepository(),
        urlOpenHandler: any UrlOpenHandler = DefaultUrlOpenHandler()
    ) {
        self.locationRepository = locationRepository
        self.urlOpenHandler = urlOpenHandler
    }
    
    private func setLocations(locations: Locations) {
        self.itemViewModels = locations.locations.map {
            PlacesListItemViewModel(location: $0, urlOpenHandler: urlOpenHandler)
        }
    }
    
    private func stopLoading() {
        self.isLoading = false
    }
    
    private func startLoading() {
        self.isLoading = true
    }
    
    @MainActor private func _fetchLocations() async {
        startLoading()
        locationRepository.fetchLocation()?.map {
            Locations.fromEntity($0)
        }
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                self.error = error
            }
        }, receiveValue: { [weak self] locations in
            self?.setLocations(locations: locations)
            self?.stopLoading()
        })
        .store(in: &cancellables)
    }
    
    func fetchLocations() {
        Task {
            await _fetchLocations()
        }
    }
}
