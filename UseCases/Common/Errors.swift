//
//  Errors.swift
//  rVPRExample
//
//  Created by Ian Kazlauskas on 23.08.16.
//  Copyright © 2016 nayzak. All rights reserved.
//

public let UseCaseErrorDomain = "UseCaseErrorDomain"

public enum UseCaseErrorCode: Int {
  case DataFetchFailed
}

struct UseCaseError: ErrorType {

  var _domain: String {
    return UseCaseErrorDomain
  }

  var _code: Int {
    return code.rawValue
  }

  private let code: UseCaseErrorCode

  init(_ code: UseCaseErrorCode) {
    self.code = code
  }
}