//
//  PendingOutput.swift
//  rVPRExample
//
//  Created by Ian Kazlauskas on 18.08.16.
//  Copyright © 2016 nayzak. All rights reserved.
//

import ReactiveKit

public protocol PendingOutput {

  var pending: Stream<Bool> { get }
}
