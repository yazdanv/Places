import XCTest
@testable import Caches

final class CacheTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testLocationCacheSave() throws {
        let testLocations = LocationsDBModel(locations: [LocationDBModel(name: "Test", lat: 0, long: 0)])
        let databaseHandler = TestDatabaseHandler()
        let locationDBHandler = LocationDBHandler(databaseHandler: databaseHandler)
        locationDBHandler.setLocations(testLocations)
        let testLocationRetrieved: LocationsDBModel? = databaseHandler.get(id: "")
        XCTAssertNotNil(testLocationRetrieved)
    }
    
    func testLocationCacheRetrieve() throws {
        let testLocations = LocationsDBModel(locations: [LocationDBModel(name: "Test", lat: 0, long: 0)])
        let databaseHandler = TestDatabaseHandler(defaultData: testLocations)
        let locationDBHandler = LocationDBHandler(databaseHandler: databaseHandler)
        let testLocationRetrieved = locationDBHandler.getLocations()
        XCTAssertNotNil(testLocationRetrieved)
    }
}
