//
//  UIViewController+Extensions.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 21.12.2023.
//

import Foundation
import UIKit

extension UIView {
  func addSubviews(_ views: UIView...) {
    views.forEach {
      self.addSubview($0)
    }
  }
}
