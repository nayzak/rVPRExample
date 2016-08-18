//
//  Bindable.swift
//  ReactiveVPR
//
//  Created by Ian Kazlauskas on 13.08.16.
//  Copyright © 2016 nayzak. All rights reserved.
//

public protocol Bindable {

  associatedtype Input

  func bind(input: Input)
}

public func bind<I, B: Bindable where B.Input == I>(input: I, to bindable: B) {
  bindable.bind(input)
}