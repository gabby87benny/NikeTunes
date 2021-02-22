//
//  NKAlbumsViewModelTests.swift
//  NikeTunesTests
//
//  Created by Gabriel on 2/21/21.
//

import XCTest
@testable import NikeTunes

class NKAlbumsViewModelTests: XCTestCase {
    var subject: NKAlbumsViewModel!
    var mockAPIManager: FakeNKTunesAPIManager!
    
    override func setUpWithError() throws {
        mockAPIManager = FakeNKTunesAPIManager()
        subject = NKAlbumsViewModel(mobileService: mockAPIManager)
    }

    override func tearDownWithError() throws {
        mockAPIManager = nil
        subject = nil
    }

    /**
    Test case to validate if data fetch method from API manager is called
    */
    
    func test_fetch_fetchRecentAlbums() {
        subject.fetchAlbums { (albums, error) in
            
        }
        XCTAssertTrue(mockAPIManager!.albumAPI_wasCalled)
    }
}
