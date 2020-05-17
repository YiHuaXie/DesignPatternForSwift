//
//  Clams.swift
//  AbstractFactory
//
//  Created by NeroXie on 2020/5/17.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

protocol Clams {
    
    func toString() -> String
}

class FreshClams: NSObject, Clams {

    func toString() -> String { "Fresh Clams from Long Island Sound" }
}

class FrozenClams: NSObject, Clams {

    func toString() -> String { "Frozen Clams from Chesapeake Bay" }
}
