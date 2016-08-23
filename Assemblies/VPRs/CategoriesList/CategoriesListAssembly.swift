//
//  CategoriesListAssembly.swift
//  rVPRExample
//
//  Created by Ian Kazlauskas on 23/08/2016.
//  Copyright © 2016 nayzak. All rights reserved.
//

import UI
import ReactiveVPR

struct CategoriesListAssembly {

  static let make: CategoriesListBuilder = { input in
    let vc = CategoriesListViewController()
    vc.rvpr_loadViewIfNeeded()

    let router = CategoriesListRouter()
    router.viewController = vc
    router.navigationController = vc.navigationController

    vc.retain(router)

    let presenter = CategoriesListPresenter(input: input, view: vc, router: router)

    bind(presenter, to: vc)
    bind(presenter, to: router)

    return (presenter, vc)
  }
}
