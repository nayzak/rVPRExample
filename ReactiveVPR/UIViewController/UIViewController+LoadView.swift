//
//  UIViewController+LoadView.swift
//  ReactiveVPR
//
//  Created by Ian Kazlauskas on 17.08.16.
//  Copyright © 2016 nayzak. All rights reserved.
//

import UIKit

public extension UIViewController {

  public func rvpr_loadViewIfNeeded() {
    if #available(iOS 9.0, *) {
      loadViewIfNeeded()
    } else {
      view.alpha = 1.0
    }
  }
}
