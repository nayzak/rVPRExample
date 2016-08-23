//
//  NormalStyleCategoriesSecvice.swift
//  rVPRExample
//
//  Created by Ian Kazlauskas on 23.08.16.
//  Copyright © 2016 nayzak. All rights reserved.
//

import ReactiveKit
@testable import Entities
import Services

class NormalStyleCategoriesSecvice: StyleCategoryService {

  let categoriesSource = [
    StyleCategory(id: 1, name: "British Origin Ales"),
    StyleCategory(id: 2, name: "Irish Origin Ales"),
    StyleCategory(id: 3, name: "North American Origin Ales"),
    StyleCategory(id: 4, name: "German Origin Ales")
  ]

  func all() -> Operation<[StyleCategory], ServiceError> {
    return .just(categoriesSource)
  }

  func invalidateCache() {

  }
}