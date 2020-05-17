//
//  Pepperoni.swift
//  AbstractFactory
//
//  Created by NeroXie on 2020/5/17.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

/// 意大利红肠
protocol Pepperoni {
    
    func toString() -> String
}

class SlicedPepperoni: NSObject, Pepperoni {
    
    func toString() -> String { "Sliced Pepperoni" }
    
}
