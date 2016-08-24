//
//  ListCategoriesInteractorTests.swift
//  rVPRExample
//
//  Created by Ian Kazlauskas on 23/08/2016.
//  Copyright © 2016 nayzak. All rights reserved.
//

import XCTest
import ReactiveKit
import Services
@testable import Entities
@testable import UseCases


class ListCategoriesInteractorTests: XCTestCase {

  override func setUp() {
    super.setUp()

  }

  override func tearDown() {
    rBag.dispose()
    super.tearDown()
  }

  func testNormalCase() {
    let service = NormalStyleCategoriesSecvice()
    let i = ListCategoriesInteractor(input: (), styleCategoryService: service)

    i.pending.expectNext([true, false])
      .disposeIn(rBag)

    i.error.expectNextCount(0)
      .disposeIn(rBag)

    i.categories.expectNext([service.categoriesSource], isEqual: { $0 == $1 })
      .disposeIn(rBag)
  }
  
}
