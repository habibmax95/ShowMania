//
//  TVShowDetailsViewModelTests.swift
//  ShowManiaTests
//
//  Created by Office on 1/5/23.
//

import XCTest

final class TVShowDetailsViewModelTests: XCTestCase {

    var sut : TVShowDetailsViewModel!
    
    override func setUpWithError() throws {
        let data = dummyTVShow.data(using: .utf8)!
        let tvShowDetails = try! JSONMapper.decode(data: data, type: TVShowDetails.self)
        sut = TVShowDetailsViewModel(showDetails: tvShowDetails)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_attributes_isEqual() throws {
        
        XCTAssertEqual(sut.id,1)
        XCTAssertEqual(sut.title, "Under the Dome")
        
        XCTAssertFalse(sut.genres.isEmpty)
        XCTAssertEqual(sut.genres, "Drama | Science-Fiction | Thriller")
        
        XCTAssertFalse(sut.image.isEmpty)
        XCTAssertEqual(sut.image, "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg")
        
        XCTAssertNotNil(sut.tvMazePath)
        XCTAssertEqual(sut.tvMazePath, "https://www.tvmaze.com/shows/1/under-the-dome")
        
        XCTAssertNotNil(sut.officialSite)
        XCTAssertEqual(sut.officialSite, "http://www.cbs.com/shows/under-the-dome/")
        
        XCTAssertFalse(sut.language.isEmpty)
        XCTAssertEqual(sut.language, "English")
        
        XCTAssertNotNil(sut.timeline)
        XCTAssertEqual(sut.timeline, "(2013-2015)")
        
        XCTAssertNotNil(sut.rating)
        XCTAssertEqual(sut.rating, "6.5")
        
        
        let demoSummery = "<p><b>Under the Dome</b> is the story of a small town that is suddenly and inexplicably sealed off from the rest of the world by an enormous transparent dome. The town's inhabitants must deal with surviving the post-apocalyptic conditions while searching for answers about the dome, where it came from and if and when it will go away.</p>"
        XCTAssertNotEqual(sut.summery, "No description")
        XCTAssertEqual(sut.summery, demoSummery)
        
    
    }

}
