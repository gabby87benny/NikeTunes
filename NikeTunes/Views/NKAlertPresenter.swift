//
//  NKAlertPresenter.swift
//  NikeTunes
//
//  Created by Gabriel on 2/19/21.
//

import UIKit

protocol NKAlertPresenter_Protocol {
    func present(from: UIViewController, title: String, message: String, dismissButtonTitle: String)
}

class NKAlertPresenter: NKAlertPresenter_Protocol {
    func present(from: UIViewController, title: String, message: String, dismissButtonTitle: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: dismissButtonTitle, style: .default, handler: nil)
        alertController.addAction(alertAction)
        from.present(alertController, animated: true, completion: nil)
    }
}
