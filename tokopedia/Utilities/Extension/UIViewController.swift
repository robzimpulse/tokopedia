//
//  UIViewController.swift
//  tokopedia
//
//  Created by Robyarta Haruli Ruci on 26/03/18.
//  Copyright © 2018 Robyarta Haruli Ruci. All rights reserved.
//

import UIKit

extension UIViewController {
  @IBAction func back(_ sender: Any){
    guard let nav = navigationController else {
      dismiss(animated: true, completion: nil)
      return
    }
    guard nav.viewControllers.count > 1 else {
      nav.dismiss(animated: true, completion: nil)
      return
    }
    nav.popViewController(animated: true)
  }
  func showAlert(title: String? = nil, message: String? = nil, withCancel: Bool = true, actions: [UIAlertAction]? = nil, completion: (() -> Void)? = nil) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { _ in
      alert.dismiss(animated: true, completion: nil)
      completion?()
    }))
    if withCancel {
      alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: { _ in
        alert.dismiss(animated: true, completion: nil)
      }))
    }
    if let actions = actions { actions.forEach({alert.addAction($0)}) }
    present(alert, animated: true, completion: nil)
  }
  func showActionSheet(title: String? = nil, message: String? = nil, actions: [UIAlertAction]? = nil, completion: (() -> Void)? = nil) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: { _ in
      alert.dismiss(animated: true, completion: nil)
      completion?()
    }))
    if let actions = actions { actions.forEach({alert.addAction($0)}) }
    present(alert, animated: true, completion: nil)
  }
  func leftBarButtonItem(color: UIColor? = nil) -> UIBarButtonItem {
    let image = (navigationController?.viewControllers.first == self) ? #imageLiteral(resourceName: "icon-close") : #imageLiteral(resourceName: "icon-back")
    let button = UIBarButtonItem(
      image: (color == nil) ? image.withRenderingMode(.alwaysOriginal) : image,
      style: .plain,
      target: self,
      action: #selector(back(_:))
    )
    if let color = color { button.tintColor = color }
    return button
  }
}
