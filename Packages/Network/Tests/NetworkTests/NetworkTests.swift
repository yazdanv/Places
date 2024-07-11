import XCTest
import Combine
@testable import Network

final class NetworkTests: XCTestCase {
    
    private var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        cancellables = []
    }
    
    func testLocationFetchSuccessfull() throws {
        // Make a location instance with a TestNetworkService and assess successful fetch
        let testLocationObject = LocationNetworkModel(name: "", lat: 0, long: 0)
        let testObject = LocationsNetworkModel(locations: [testLocationObject])
        let networkService = TestNetworkService(object: testObject)
        let locationNetworkService = LocationNetworkService(networkService: networkService)
        locationNetworkService.getLocations()?.sink { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                XCTFail("Failed with error: \(error)")
            }
        } receiveValue: { locations in
            XCTAssertNotNil(locations)
        }.store(in: &cancellables)
    }
    
    func testLocationFetchUnsuccessfull() throws {
        let networkService = TestNetworkService<LocationsNetworkModel>()
        let locationNetworkService = LocationNetworkService(networkService: networkService)
        locationNetworkService.getLocations()?.sink { completion in
            switch completion {
            case .finished:
                XCTFail("Should fail")
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        } receiveValue: { locations in
            XCTFail("Should fail")
        }.store(in: &cancellables)
    }
    
    
}

