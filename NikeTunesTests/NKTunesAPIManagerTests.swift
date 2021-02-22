//
//  NKTunesAPIManagerTests.swift
//  NikeTunesTests
//
//  Created by Gabriel on 2/21/21.
//

import XCTest
@testable import NikeTunes

class NKTunesAPIManagerTests: XCTestCase {
    var subject: NKTunesAPIManager!
    
    override func setUpWithError() throws {
        subject = NKTunesAPIManager()
    }

    override func tearDownWithError() throws {
        subject = nil
    }

    /**
    Test case to validate the network fetch from Apple Albums API is functional or not
    */
    
    func test_fetch_recent_albums() {
        let expect = XCTestExpectation(description: "callback")

        subject.getAlbums { result in
            expect.fulfill()
            
            switch result {
                case .success(let nkAlbums):
                    //if let albums = nkAlbums {
                        XCTAssertGreaterThan(nkAlbums.count, 0)
                        
                        for nAlbum in nkAlbums {
                            XCTAssertNotNil(nAlbum.name)
                        }
                    //}
                
                case .failure(let error):
                    print("Error: \(error)")
                    
            }
        }
        
        wait(for: [expect], timeout: 3.1)
    }

}
