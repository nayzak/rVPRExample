//
//  Helpers.swift
//  rVPRExample
//
//  Created by Ian Kazlauskas on 24.08.16.
//  Copyright © 2016 nayzak. All rights reserved.
//

import XCTest
import ReactiveKit

extension _StreamType where Event.Element: Equatable {

  @warn_unused_result
  func expectNext(expectedElements: [Event.Element], _ message: String = "", file: StaticString = #file, line: UInt = #line) -> Disposable {
    return expectNext(expectedElements, message, file: file, line: line, isEqual: ==)
  }
}

extension _StreamType {

  @warn_unused_result
  func expectNext(expectedElements: [Event.Element], _ message: String = "", file: StaticString = #file, line: UInt = #line, isEqual: (Event.Element,Event.Element) -> Bool ) -> Disposable {
    var elementsToProcess = expectedElements
    var receivedElements: [Event.Element] = []
    let receivedElementsCount = Bag<UInt>(0)

    let disposable = observeNext { element in

      receivedElements.append(element)
      receivedElementsCount.value += 1

      if elementsToProcess.count == 0 {
        XCTFail("Got more elements then expected.")
        return
      }

      let expected = elementsToProcess.removeFirst()
      XCTAssert(
        isEqual(element, expected),
        message + "(Got \(receivedElements) instead of \(expectedElements))",
        file: file,
        line: line
      )
    }

    return ExpectationDisposable(disposable: disposable,
                      expectedElementsCount: UInt(expectedElements.count),
                      receivedElementsCount: receivedElementsCount,
                                    message: message,
                                       file: file,
                                       line: line)
  }

  @warn_unused_result
  func expectNextCount(expectedElementsCount: UInt, _ message: String = "", file: StaticString = #file, line: UInt = #line) -> Disposable {
    let receivedElementsCount = Bag<UInt>(0)

    let disposable = observeNext { _ in
      receivedElementsCount.value += 1
    }

    return ExpectationDisposable(disposable: disposable,
                      expectedElementsCount: expectedElementsCount,
                      receivedElementsCount: receivedElementsCount,
                                    message: message,
                                       file: file,
                                       line: line)
  }
}

private final class Bag<T> {
  var value: T

  init(_ value: T) {
    self.value = value
  }
}

private final class ExpectationDisposable: Disposable {

  private let disposable: Disposable
  private let expectedElementsCount: UInt
  private let receivedElementsCount: Bag<UInt>
  private let message: String
  private let file: StaticString
  private let line: UInt

  var isDisposed: Bool {
    return disposable.isDisposed
  }

  init(disposable: Disposable, expectedElementsCount: UInt, receivedElementsCount: Bag<UInt>, message: String, file: StaticString, line: UInt) {
    self.disposable = disposable
    self.expectedElementsCount = expectedElementsCount
    self.receivedElementsCount = receivedElementsCount
    self.message = message
    self.file = file
    self.line = line
  }

  func dispose() {
    disposable.dispose()

    XCTAssert(
      expectedElementsCount == receivedElementsCount.value,
      message + "(Got \(receivedElementsCount.value) events instead of \(expectedElementsCount))",
      file: file,
      line: line
    )
  }

  func disposeIn(disposeBag: DisposeBag) {
    disposeBag.addDisposable(self)
  }
}

