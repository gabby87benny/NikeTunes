//
//  UIView+NKExtensions.swift
//  NikeTunes
//
//  Created by Gabriel on 2/19/21.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView ...) {
        views.forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

