//
//  StylesListAssembly.swift
//  rVPRExample
//
//  Created by Ian Kazlauskas on 23/08/2016.
//  Copyright © 2016 nayzak. All rights reserved.
//

import UI
import ReactiveVPR

struct StylesListAssembly {

  static let make: StylesListBuilder = { input in
    let vc = StylesListViewController()
    vc.rvpr_loadViewIfNeeded()

    let router = StylesListRouter()
    router.viewController = vc
    router.navigationController = vc.navigationController

    vc.retain(router)

    let presenter = StylesListPresenter(input: input, view: vc, router: router)

    bind(presenter, to: vc)
    bind(presenter, to: router)

    return (presenter, vc)
  }
}
