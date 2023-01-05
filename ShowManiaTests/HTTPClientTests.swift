//
//  HTTPClientTests.swift
//  ShowManiaTests
//
//  Created by Office on 1/5/23.
//

import XCTest

final class HTTPClientTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_shouldThrow_BadURL() async throws {
        let endpoint = Endpoint.showSearch(title: "Bad Url")
        let client = HTTPClient()
        
        do {
            _ = try await client.request(endpoint: endpoint, type: SearchItem.self)
            XCTFail("This call should throw bad url error.")
        }
        catch let error {
            XCTAssertTrue(error is NetworkError)
            let error = error as? NetworkError
            XCTAssertEqual(error?.errorDescription, NetworkError.badUrl.errorDescription)
        }
        
    }
    
    func test_shouldThrow_DecodingError() async throws {
        let endpoint = Endpoint.showSearch(title: "Batman")
        let client = HTTPClient()
        
        do {
            _ = try await client.request(endpoint: endpoint, type: SearchItem.self)
            XCTFail("This call should throw decoding error.")
        }
        catch let error {
            XCTAssertTrue(error is NetworkError)
            let error = error as? NetworkError
            XCTAssertEqual(error?.errorDescription, NetworkError.decodingError.errorDescription)
        }
        
    }
    
    func test_ResponseData_isCorrect() async throws {
        let endpoint = Endpoint.showDetail(id: 1)
        let client = HTTPClient()
        
        do {
            let tvShow = try await client.request(endpoint: endpoint, type: TVShow.self)
            XCTAssertEqual(tvShow.id, 1)
        }
        catch {
            XCTFail("This call shouldn't throw any error.")
        }
        
    }

}
