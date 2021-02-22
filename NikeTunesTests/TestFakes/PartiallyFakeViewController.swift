//
//  NikeTunesTests.swift
//  NikeTunesTests
//
//  Created by Gabriel on 2/21/21.
//

@testable import NikeTunes
import UIKit

class PartiallyFakeViewController: UIViewController {
    var present_wasCalled = false
    var present_wasCalled_withArgs: (viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?)? = nil

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        present_wasCalled = true
        present_wasCalled_withArgs = (viewControllerToPresent: viewControllerToPresent, animated: flag, completion: completion)
    }
}
