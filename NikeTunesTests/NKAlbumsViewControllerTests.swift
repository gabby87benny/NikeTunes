//
//  NKAlbumsViewControllerTests.swift
//  NikeTunesTests
//
//  Created by Gabriel on 2/21/21.
//

import XCTest
@testable import NikeTunes

class NKAlbumsViewControllerTests: XCTestCase {
    var sut: NKAlbumsViewController!
    var alertPresenter: FakeNKAlertPresenter!
    var viewModel: FakeNKAlbumsViewModel!
    var spinner: FakeActivityIndicatorViewController = FakeActivityIndicatorViewController()
    
    override func setUpWithError() throws {
        alertPresenter = FakeNKAlertPresenter()
        viewModel = FakeNKAlbumsViewModel()
        sut = NKAlbumsViewController(viewModel: viewModel, alertPresenter: alertPresenter)
        sut.spinnerView = spinner
    }

    override func tearDownWithError() throws {
        alertPresenter = nil
        viewModel = nil
        sut = nil
    }

    /**
    Test case to validate if view has loaded
    */
    
    func testIfViewIsLoaded() {
        XCTAssertNotNil(sut.view)
    }
    
    /**
    Test case to validate if spinner is displayed when view has loaded
    */
    
    func testIfSpinnerIsLoadingWhileViewLoad() {
        XCTAssertNotNil(sut.view)
        XCTAssertFalse(spinner.activityIndicator_IsAnimating)
    }
    
    /**
    Test case to validate if data fetch happens when view has loaded
    */
    
    func testIfDataFetchHappensWhileViewLoad() {
        XCTAssertNotNil(sut.view)
        XCTAssertTrue(viewModel.nkAlbumModel_wasCalled)
    }
}
