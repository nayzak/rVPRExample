//
//  ListCategoriesProtocol.swift
//  rVPRExample
//
//  Created by Ian Kazlauskas on 23/08/2016.
//  Copyright © 2016 nayzak. All rights reserved.
//

import Entities
import ReactiveKit


//MARK: IO

public typealias ListCategoriesInteractorInput = ()

public protocol ListCategoriesInteractorOutput: PendingOutput, ErrorOutput {
  var categories: Stream<[StyleCategory]> { get }
}


//MARK: Builder

public typealias ListCategoriesInteractorBuilder = (input: ListCategoriesInteractorInput) -> ListCategoriesInteractorOutput
