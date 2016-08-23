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

  func testNormalFlow() {
    let service = NormalStyleCategoriesSecvice()

    let i = ListCategoriesInteractor(input: (), styleCategoryService: service)

    let pending = Property<Bool?>(nil)
    i.pending.bindTo(pending)

    let pendingTriggedCount = Property(0)
    i.pending.map({ _ in 1 }).scan(0, +).bindTo(pendingTriggedCount)

    let error = Property<InteractorError?>(nil)
    i.error.bindTo(error)

    let categories = Property<[StyleCategory]?>(nil)
    i.categories.bindTo(categories)

    XCTAssertNil(error.value)
    XCTAssertEqual(pendingTriggedCount.value, 2)
    XCTAssertEqual(pending.value!, false)
    XCTAssertEqual(categories.value!.count, service.categoriesSource.count)
    zip(categories.value!, service.categoriesSource).forEach {
      XCTAssertEqual($0, $1)
    }
  }

}
