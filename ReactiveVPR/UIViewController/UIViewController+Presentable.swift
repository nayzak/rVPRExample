//
//  UIViewController+Presentable.swift
//  ReactiveVPR
//
//  Created by Ian Kazlauskas on 17.08.16.
//  Copyright © 2016 nayzak. All rights reserved.
//

import UIKit

extension UIViewController: Presentable {

  public func embed(into parent: UIViewController, using container: UIView) {
    parent.addChildViewController(self)
    view.frame = container.bounds
    view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
    container.addSubview(view)
    didMoveToParentViewController(parent)
  }

  public func putIn(window window: UIWindow) {
    window.rootViewController = self
  }

  public func present(using presenter: UIViewController) {
    presenter.presentViewController(self, animated: true, completion: nil)
  }

  public func present(using presenter: UIViewController, with transition: UIViewControllerTransitioningDelegate) {
    modalPresentationStyle = .Custom
    transitioningDelegate = transition
    present(using: presenter)
  }

  public func push(into nc: UINavigationController, animated: Bool) {
    nc.pushViewController(self, animated: animated)
  }

  public func push(into nc: UINavigationController) {
    push(into: nc, animated: true)
  }

  public func dismiss() {
    if let nc = navigationController {
      nc.popToViewController(self, animated: false)
      nc.popViewControllerAnimated(true)
      return
    }

    if let presenter = presentingViewController {
      presenter.dismissViewControllerAnimated(true, completion: nil)
      return
    }
  }

  public func dismiss(with transition: UIViewControllerTransitioningDelegate) {
    modalPresentationStyle = .Custom
    transitioningDelegate = transition
    dismiss()
  }

  public func presentAsNavigation(using presenter: UIViewController) {
    if self is UINavigationController {
      present(using: presenter)
      return
    }

    let nc = navigationController ?? UINavigationController(rootViewController: self)
    nc.present(using: presenter)
  }

  public func presentAsNavigation(using presenter: UIViewController, with transition: UIViewControllerTransitioningDelegate) {
    if self is UINavigationController {
      present(using: presenter, with: transition)
      return
    }

    let nc = navigationController ?? UINavigationController(rootViewController: self)
    nc.present(using: presenter, with: transition)
  }
}
