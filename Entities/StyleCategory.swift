//
//  Category.swift
//  rVPRExample
//
//  Created by Ian Kazlauskas on 23.08.16.
//  Copyright © 2016 nayzak. All rights reserved.
//

public struct StyleCategory {
  public let id: Int
  public let name: String
}

extension StyleCategory: Equatable { }

public func ==(lhs: StyleCategory, rhs: StyleCategory) -> Bool {
  return lhs.id == rhs.id
}