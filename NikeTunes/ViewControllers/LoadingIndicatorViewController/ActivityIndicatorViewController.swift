//
//  CLRestaurantsViewController.swift
//  Restaurants
//
//  Created by Joseph Peter, Gabriel Benny Francis on 1/20/21.
//

import UIKit

class ActivityIndicatorViewController: UIViewController {
    var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        initializeActivityIndicator()
    }
    
    func initializeActivityIndicator() {
        let activityView = UIActivityIndicatorView(style: .large)
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        self.spinner = activityView
    }
    
    /**
    Displays activity indicator above the parent view controller.

    - Parameters:
       - parent: The parent view controller
    */
    
    func showActivityIndicatorView(on parent: UIViewController) {
        parent.view.addSubview(self.view)
        spinner.startAnimating()
    }

    /**
    Removes activity indicator view
    */
    
    func removeActivityIndicatorView() {
        spinner.stopAnimating()
        self.view.removeFromSuperview()
    }
}
