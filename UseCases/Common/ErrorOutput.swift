//
//  ErrorOutput.swift
//  rVPRExample
//
//  Created by Ian Kazlauskas on 23.08.16.
//  Copyright © 2016 nayzak. All rights reserved.
//

import ReactiveKit

public protocol ErrorOutput {

  var error: Stream<ErrorType> { get }
}