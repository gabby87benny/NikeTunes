//
//  FakeNKAlertPresenter.swift
//  NikeTunesTests
//
//  Created by Gabriel on 2/21/21.
//

@testable import NikeTunes
import Foundation
import UIKit

class FakeNKAlertPresenter: NKAlertPresenter_Protocol {
    var present_wasCalled = false
    var present_wasCalled_withArgs: (from: UIViewController, title: String, message: String, dismissButtonTitle: String)? = nil

    func present(from: UIViewController, title: String, message: String, dismissButtonTitle: String) {
        present_wasCalled = true
        present_wasCalled_withArgs = (from: from, title: title, message: message, dismissButtonTitle: dismissButtonTitle)
    }
}

