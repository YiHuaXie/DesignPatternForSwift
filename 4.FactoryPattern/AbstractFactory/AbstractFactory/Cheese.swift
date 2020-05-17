//
//  Cheese.swift
//  AbstractFactory
//
//  Created by NeroXie on 2020/5/17.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

///芝士
protocol Cheese {
    
    func toString() -> String
}

class MozzarellaCheese: NSObject, Cheese {
    
    func toString() -> String { "Shredded Mozzarella" }
}

class ReggianoCheese: NSObject, Cheese {
    
    func toString() -> String { "Reggiano Cheese" }
}
