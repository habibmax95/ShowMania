//
//  TVShowViewModelTests.swift
//  ShowManiaTests
//
//  Created by Office on 1/5/23.
//

import XCTest

final class TVShowViewModelTests: XCTestCase {
    
    var sut: TVShowViewModel!

    override func setUpWithError() throws {
        let data = dummyTVShow.data(using: .utf8)!
        let tvShow = try! JSONMapper.decode(data: data, type: TVShow.self)
        sut = TVShowViewModel(show: tvShow)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_attributes_isEqual() throws {
        XCTAssertEqual(sut.id,1)
        XCTAssertEqual(sut.title, "Under the Dome")
        
        /*
         genres: [
         "Drama",
         "Science-Fiction",
         "Thriller"
         ]
         */
        XCTAssertFalse(sut.genres.isEmpty)
        XCTAssertEqual(sut.genres, "Drama | Science-Fiction | Thriller")
        
        /*
         image: {
         medium: "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg",
         original: "https://static.tvmaze.com/uploads/images/original_untouched/81/202627.jpg"
         }
         */
        XCTAssertFalse(sut.image.isEmpty)
        XCTAssertEqual(sut.image, "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg")
    }

}
