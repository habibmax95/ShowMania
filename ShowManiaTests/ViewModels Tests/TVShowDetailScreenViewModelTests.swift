//
//  TVShowDetailScreenViewModelTests.swift
//  ShowManiaTests
//
//  Created by Office on 1/5/23.
//

import XCTest

final class TVShowDetailScreenViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_fetchData_isSuccessful() async throws {
        let data = dummyTVShow.data(using: .utf8)!
        
        let mapper = try JSONMapper.decode(data: data, type: TVShowDetails.self)
        
        let mockClient = MockHTTPClient(data: data, urlResponse: nil, error: nil)
    
        let sut = TVShowDetailScreenViewModel(client: mockClient)
        
        XCTAssertNil(sut.showDetail)
        
        
        await sut.getShowDetailsBy(id: 1)
        
        XCTAssertNotNil(sut.showDetail)
        XCTAssertEqual(sut.showDetail?.id,mapper.id)
    }

}
