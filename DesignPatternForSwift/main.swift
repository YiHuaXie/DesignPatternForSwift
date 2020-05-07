//
//  main.swift
//  DesignPatternForSwift
//
//  Created by NeroXie on 2020/5/7.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation
//withUnsafePointer<T, Result>(to value: T, _ body: (UnsafePointer<T>) throws -> Result) rethrows -> Result
func address<T>(o: T) -> String {
    withUnsafePointer(to: o) { "\($0)" }
}

StrategyPattern.test()
ObserverPattern.test()
