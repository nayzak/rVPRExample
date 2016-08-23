//
//  StyleCategoryService.swift
//  rVPRExample
//
//  Created by Ian Kazlauskas on 23.08.16.
//  Copyright © 2016 nayzak. All rights reserved.
//

import Entities
import ReactiveKit

public protocol StyleCategoryService: Cachable {

  func all() -> Operation<[StyleCategory], ServiceError>
}