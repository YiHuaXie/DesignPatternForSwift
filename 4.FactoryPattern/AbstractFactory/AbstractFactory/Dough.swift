//
//  Dough.swift
//  AbstractFactory
//
//  Created by NeroXie on 2020/5/17.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

/// 面团
protocol Dough {
    
    func toString() -> String
}

class ThickCrustDough: NSObject, Dough {
    
    func toString() -> String { "ThickCrust style extra thick crust dough" }
}

class ThinCrustDough: NSObject, Dough {
    
    func toString() -> String { "Thin Crust Dough" }
}
