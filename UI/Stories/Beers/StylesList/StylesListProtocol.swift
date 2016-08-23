//
//  StylesListProtocol.swift
//  rVPRExample
//
//  Created by Ian Kazlauskas on 23/08/2016.
//  Copyright © 2016 nayzak. All rights reserved.
//

import ReactiveVPR
import ReactiveKit


//MARK: View

public protocol StylesListViewInput {

}

public protocol StylesListViewOutput {

}


//MARK: Router

public protocol StylesListRouterInput {

}

public protocol StylesListRouterOutput {

}


//MARK: Module

public typealias StylesListInput = ()

public protocol StylesListOutput {

}

public typealias StylesListBuilder = (input: StylesListInput) -> (StylesListOutput, Presentable)
