//
//  UINavigationController.swift
//  SaleManager
//
//  Created by Evgeniy Opryshko on 01/01/2019.
//  Copyright © 2019 com.sales.my. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    /// Closing the ViewController
    ///
    /// - Parameters:
    ///   - navigationController
    
    
    func dismiss(_ navigationController: UINavigationController) {
        navigationController.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
