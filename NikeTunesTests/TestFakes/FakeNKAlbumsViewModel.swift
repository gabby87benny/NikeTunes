//
//  FakeNKAlbumsViewModel.swift
//  NikeTunesTests
//
//  Created by Gabriel on 2/21/21.
//

@testable import NikeTunes
import Foundation
import UIKit

class FakeNKAlbumsViewModel: NKAlbumsViewModel {
    typealias CompletionResult = ([NKAlbum], Error?) -> ()
    var nkAlbumModel_wasCalled = false
    var nkAlbumModel_wasCalled_withCompletion: CompletionResult?
    
    override func fetchAlbums(completion: @escaping CompletionResult) {
        nkAlbumModel_wasCalled = true
        nkAlbumModel_wasCalled_withCompletion = completion
    }
}
