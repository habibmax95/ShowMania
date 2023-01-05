//
//  TVShowListViewModelTests.swift
//  ShowManiaTests
//
//  Created by Office on 1/5/23.
//

import XCTest

final class TVShowListViewModelTests: XCTestCase {

    var sut : TVShowListViewModel!

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_fetchData_isSuccessful() async throws {
        
        let data = dummySearchResult.data(using: .utf8)!
        
        let mapper = try JSONMapper.decode(data: data, type: [SearchItem].self)
        
        let mockClient = MockHTTPClient(data: data, urlResponse: nil, error: nil)
    
        let sut = TVShowListViewModel(client: mockClient)
        
        XCTAssertTrue(sut.shows.isEmpty)
        XCTAssertEqual(sut.shows.count,0)
        
        
        await sut.searchBy(title: "")
        
        XCTAssertFalse(sut.shows.isEmpty)
        XCTAssertGreaterThan(sut.shows.count, 0)
        XCTAssertEqual(sut.shows.count,mapper.count)
        
    }

}
