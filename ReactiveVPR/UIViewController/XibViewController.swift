//
//  XibViewController.swift
//  ReactiveVPR
//
//  Created by Ian Kazlauskas on 18.08.16.
//  Copyright © 2016 nayzak. All rights reserved.
//

import UIKit

public class XibViewController: UIViewController {

  public init() {
    var nibName = String(self.dynamicType)
    if nibName.hasSuffix("ViewController") {
      let removalRange = nibName.endIndex.advancedBy(-10)..<nibName.endIndex
      nibName.removeRange(removalRange)
    }
    let bundle = NSBundle(forClass: self.dynamicType)

    super.init(nibName: nibName, bundle: bundle)
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
