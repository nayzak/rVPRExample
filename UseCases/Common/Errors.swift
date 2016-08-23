//
//  Errors.swift
//  rVPRExample
//
//  Created by Ian Kazlauskas on 23.08.16.
//  Copyright © 2016 nayzak. All rights reserved.
//

import Services

public enum InteractorError: ErrorType {

  case ServiceError(error: Services.ServiceError)
}

extension InteractorError {

  init(serviceError: Services.ServiceError) {
    self = InteractorError.ServiceError(error: serviceError)
  }
}