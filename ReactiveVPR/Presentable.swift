//
//  Presentable.swift
//  ReactiveVPR
//
//  Created by Ian Kazlauskas on 17.08.16.
//  Copyright © 2016 nayzak. All rights reserved.
//

import UIKit

public protocol Presentable: class {

  func embed(into parent: UIViewController, using container: UIView)

  func putIn(window window: UIWindow)

  func putAsNavigationIn(window window: UIWindow)

  func present(using presenter: UIViewController)

  func present(using presenter: UIViewController, with transition: UIViewControllerTransitioningDelegate)

  func push(into nc: UINavigationController)

  func push(into nc: UINavigationController, animated: Bool)

  func dismiss()

  func dismiss(with transition: UIViewControllerTransitioningDelegate)

  func presentAsNavigation(using presenter: UIViewController)

  func presentAsNavigation(using presenter: UIViewController, with transition: UIViewControllerTransitioningDelegate)
}