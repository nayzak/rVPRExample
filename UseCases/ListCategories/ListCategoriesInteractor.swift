//
//  ListCategoriesInteractor.swift
//  rVPRExample
//
//  Created by Ian Kazlauskas on 23/08/2016.
//  Copyright © 2016 nayzak. All rights reserved.
//

import Entities
import Services
import ReactiveKit

public struct ListCategoriesInteractor: ListCategoriesInteractorOutput {

  public let pending: Stream<Bool>
  public let error: Stream<InteractorError>
  public let categories: Stream<[StyleCategory]>

  public init(input: ListCategoriesInteractorInput, styleCategoryService: StyleCategoryService) {

    let styleCategoryServiceActivity = PushStream<Bool>()
    let styleCategoryServiceError = PushStream<ServiceError>()

    self.categories = styleCategoryService.all()
      .feedActivityInto(styleCategoryServiceActivity)
      .toStream(feedErrorInto: styleCategoryServiceError)
      .shareReplay()

    self.error = styleCategoryServiceError.map(InteractorError.init).shareReplay()
    self.pending = styleCategoryServiceActivity.toStream().shareReplay()
  }
}