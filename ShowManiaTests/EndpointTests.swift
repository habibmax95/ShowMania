//
//  EndpointTests.swift
//  ShowManiaTests
//
//  Created by Office on 1/5/23.
//

import XCTest

final class EndpointTests: XCTestCase {

    func test_showSearch_endpoint_isValid(){
        let endpoint = Endpoint.showSearch(title: "batman")

        XCTAssertEqual(endpoint.url?.absoluteString, "https://api.tvmaze.com/search/shows?q=batman", "The endpoint path are not equal")
    
    }
    
    func test_showDetail_endpoint_isValid(){
        
        let endpoint = Endpoint.showDetail(id: 1)

        XCTAssertEqual(endpoint.url?.absoluteString, "https://api.tvmaze.com/shows/1", "The endpoint path are not equal")
    
    }

}
