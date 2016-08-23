//
//  ListCategoriesInteractor.swift
//  rVPRExample
//
//  Created by Ian Kazlauskas on 23/08/2016.
//  Copyright © 2016 nayzak. All rights reserved.
//

import Entities
import ReactiveKit

public struct ListCategoriesInteractor: ListCategoriesInteractorOutput {

  public let pending: Stream<Bool>
  public let error: Stream<ErrorType>
  public let categories: Stream<[StyleCategory]>

  public init(input: ListCategoriesInteractorInput) {
    pending = .just(false)
    error = .completed()
    categories = .just([])
  }
}