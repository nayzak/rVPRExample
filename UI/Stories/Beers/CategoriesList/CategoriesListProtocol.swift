//
//  CategoriesListProtocol.swift
//  rVPRExample
//
//  Created by Ian Kazlauskas on 23/08/2016.
//  Copyright © 2016 nayzak. All rights reserved.
//

import ReactiveVPR
import ReactiveKit


//MARK: View

public protocol CategoriesListViewInput {

}

public protocol CategoriesListViewOutput {

}


//MARK: Router

public protocol CategoriesListRouterInput {

}

public protocol CategoriesListRouterOutput {

}


//MARK: Module

public typealias CategoriesListInput = ()

public protocol CategoriesListOutput {

}

public typealias CategoriesListBuilder = (input: CategoriesListInput) -> (CategoriesListOutput, Presentable)
