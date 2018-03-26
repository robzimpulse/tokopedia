//
//  UINavigationViewController.swift
//  tokopedia
//
//  Created by Robyarta Haruli Ruci on 26/03/18.
//  Copyright © 2018 Robyarta Haruli Ruci. All rights reserved.
//

import UIKit

extension UINavigationController {
  open override var preferredStatusBarStyle: UIStatusBarStyle {
    return topViewController?.preferredStatusBarStyle ?? .default
  }
  func isRoot(VC: UIViewController) -> Bool {
    return viewControllers.first == VC
  }
}

