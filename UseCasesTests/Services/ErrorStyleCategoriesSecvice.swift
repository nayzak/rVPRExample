//
//  ErrorStyleCategoriesSecvice.swift
//  rVPRExample
//
//  Created by Ian Kazlauskas on 23.08.16.
//  Copyright © 2016 nayzak. All rights reserved.
//

import ReactiveKit
@testable import Entities
import Services

class ErrorCategoriesSecvice: StyleCategoryService {

  func all() -> Operation<[StyleCategory], ServiceError> {
    return .failure(.ConnectionLost)
  }

  func invalidateCache() {

  }
}
