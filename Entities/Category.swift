//
//  Category.swift
//  rVPRExample
//
//  Created by Ian Kazlauskas on 23.08.16.
//  Copyright © 2016 nayzak. All rights reserved.
//

public struct Category {
  public let id: Int
  public let name: String
}

extension Category: Equatable { }

public func ==(lhs: Category, rhs: Category) -> Bool {
  return lhs.id == rhs.id
}