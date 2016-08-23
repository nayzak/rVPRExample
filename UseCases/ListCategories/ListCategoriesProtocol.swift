//
//  ListCategoriesProtocol.swift
//  rVPRExample
//
//  Created by Ian Kazlauskas on 23/08/2016.
//  Copyright © 2016 nayzak. All rights reserved.
//

import ReactiveKit


//MARK: IO

public typealias ListCategoriesInteractorInput = ()

public protocol ListCategoriesInteractorOutput {

}


//MARK: Builder

public typealias ListCategoriesInteractorBuilder = (input: ListCategoriesInteractorInput) -> ListCategoriesInteractorOutput
