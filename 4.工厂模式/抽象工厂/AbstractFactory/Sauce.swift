//
//  Sauce.swift
//  AbstractFactory
//
//  Created by NeroXie on 2020/5/17.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

/// 酱
protocol Sauce {
    
    func toString() -> String
}

class PlumTomatoSauce: NSObject, Sauce {
    
    func toString() -> String { "Tomato sauce with plum tomatoes" }
}

class MarinaraSauce: NSObject, Sauce {
    
    func toString() -> String { "Marinara Sauce" }
}


