//
//  ListCategoriesInteractorAssembly.swift
//  rVPRExample
//
//  Created by Ian Kazlauskas on 23/08/2016.
//  Copyright © 2016 nayzak. All rights reserved.
//

import UseCases
import Services

struct ListCategoriesInteractorAssembly {

  static let make: ListCategoriesInteractorBuilder = { input in
    return ListCategoriesInteractor(
      input: input,
      styleCategoryService: StyleCategoryServiceMoc()
    )
  }
}
