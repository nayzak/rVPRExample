//
//  UIViewController+Retain.swift
//  ReactiveVPR
//
//  Created by Ian Kazlauskas on 12.08.16.
//  Copyright © 2016 nayzak. All rights reserved.
//

import UIKit

public extension UIViewController {

  private struct AssociatedKeys {
    static var RetainCollectionKey = "RetainCollectionKey"
  }

  private var retainCollection: NSMutableArray {
    if let retainCollection: AnyObject = objc_getAssociatedObject(self, &AssociatedKeys.RetainCollectionKey) {
      return retainCollection as! NSMutableArray
    } else {
      let retainCollection = NSMutableArray()
      objc_setAssociatedObject(self, &AssociatedKeys.RetainCollectionKey, retainCollection, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      return retainCollection
    }
  }

  public func retain(object: AnyObject) {
    retainCollection.addObject(object)
  }

}
