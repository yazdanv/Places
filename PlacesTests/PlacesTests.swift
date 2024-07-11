//
//  PlacesTests.swift
//  PlacesTests
//
//  Created by Yazdan Vakili on 08/07/2024.
//

import XCTest
import Combine
@testable import Places

final class PlacesTests: XCTestCase {
    

    private var cancellables: Set<AnyCancellable> = []
    
    func testFetchLocationsSuccess() async {

        let locationName = "Location 1"
        let testLocations = Locations(locations: [
            Location(name: locationName, lat: 1.0, long: 1.0),
        ])
        let mockRepository = TestLocationRepository(locations: testLocations)
        let viewModel = PlacesListViewModel(locationRepository: mockRepository)
        
        viewModel.$itemViewModels
            .dropFirst()
            .sink { itemViewModels in
                XCTAssertEqual(itemViewModels.count, 1)
                XCTAssertEqual(itemViewModels[0].location.name, locationName)
            }
            .store(in: &cancellables)

        viewModel.fetchLocations()
    }
    
    func testFetchLocationsFailure() async {
        let mockRepository = TestLocationRepository()
        let viewModel = PlacesListViewModel(locationRepository: mockRepository)
        
        viewModel.$error
            .dropFirst()
            .sink { error in
                XCTAssertNotNil(error)
            }
            .store(in: &cancellables)
        
        viewModel.fetchLocations()
    }
    
    func testIsLoadingStartsTrueFinishesFalse() {
        let expectation = XCTestExpectation(description: "Loading state changes")
        let testLocations = Locations(locations: [
            Location(name: "Location 1", lat: 1.0, long: 1.0)
        ])
        let mockRepository = TestLocationRepository(locations: testLocations)
        let viewModel = PlacesListViewModel(locationRepository: mockRepository)
        
        viewModel.$isLoading
            .dropFirst() // Ignore the initial value
            .sink { isLoading in
                if isLoading {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.fetchLocations()

        wait(for: [expectation], timeout: 1.0)
        XCTAssertFalse(viewModel.isLoading)
    }
    
}
