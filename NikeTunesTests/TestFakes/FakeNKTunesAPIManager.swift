//
//  FakeNKTunesAPIManager.swift
//  NikeTunesTests
//
//  Created by Gabriel on 2/21/21.
//

import Foundation
@testable import NikeTunes

class FakeNKTunesAPIManager: NKTunesAPIManager_Protocol {
    var albumAPI_wasCalled = false
    var albumAPI_wasCalled_withCompletion: ((Result<[NKAlbum], NKAlbumError>) -> Void)?
    
    func getAlbums(completion: @escaping (Result<[NKAlbum], NKAlbumError>) -> Void) {
        albumAPI_wasCalled = true
        albumAPI_wasCalled_withCompletion = completion
    }
}
