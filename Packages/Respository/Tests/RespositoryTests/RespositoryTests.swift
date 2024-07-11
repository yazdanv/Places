import XCTest
import Combine
@testable import Repository

final class RespositoryTests: XCTestCase {
    private var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        cancellables = []
    }
    
    func testLocationFetchSuccessfull() throws {
        let locations = LocationsTestObject(locations: [LocationTestObject(name: "", lat: 0, long: 0)])
        let networkService = TestLocationNetworkService(locations: locations)
        let cacheService = TestLocationCacheService()
        let repository = LocationRepository(networkService: networkService, cacheService: cacheService)
        
        repository.fetchLocation()?.sink { completion in
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
    
    func testCacheSaveSuccessfull() throws {
        let locations = LocationsTestObject(locations: [LocationTestObject(name: "", lat: 0, long: 0)])
        let networkService = TestLocationNetworkService(locations: locations)
        let cacheService = TestLocationCacheService()
        let repository = LocationRepository(networkService: networkService, cacheService: cacheService)
        repository.fetchLocation()?.sink { _ in } receiveValue: { _ in }.store(in: &cancellables)
        XCTAssertNotNil(cacheService.locations)
    }
    
    func testSuccessfulCacheRetrieval() throws {
        let locations = LocationsTestObject(locations: [LocationTestObject(name: "", lat: 0, long: 0)])
        let networkService = TestLocationNetworkService()
        let cacheService = TestLocationCacheService(locations: locations)
        let repository = LocationRepository(networkService: networkService, cacheService: cacheService)
        repository.fetchLocation()?.sink { completion in
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
    
}
