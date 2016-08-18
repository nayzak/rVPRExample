//
//  Router.swift
//  ReactiveVPR
//
//  Created by Ian Kazlauskas on 17.08.16.
//  Copyright © 2016 nayzak. All rights reserved.
//

import UIKit
import ReactiveKit

public class Router<V: UIViewController> {

  public weak var window: UIWindow?
  public weak var navigationController: UINavigationController?
  public weak var viewController: V!

  let rBag = DisposeBag()
}