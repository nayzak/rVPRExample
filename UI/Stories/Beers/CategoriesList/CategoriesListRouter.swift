//
//  CategoriesListRouter.swift
//  rVPRExample
//
//  Created by Ian Kazlauskas on 23/08/2016.
//  Copyright © 2016 nayzak. All rights reserved.
//

import UIKit
import ReactiveVPR
import ReactiveKit

public final class CategoriesListRouter: Router<UIViewController> {

  //MARK: Module builders


  public override init() {

  }
}

extension CategoriesListRouter: CategoriesListRouterOutput {

}

extension CategoriesListRouter: Bindable {

  public func bind(input: CategoriesListRouterInput) {

  }
}
