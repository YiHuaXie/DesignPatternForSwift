//
//  Veggies.swift
//  AbstractFactory
//
//  Created by NeroXie on 2020/5/17.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

/// 蔬菜
protocol Veggies {
    
    func toString() -> String
}

class BlackOlives: NSObject, Veggies {
    
    func toString() -> String { "Black Olives" }
}

class Spinach: NSObject, Veggies {
    
    func toString() -> String { "Spinach" }
}

class Eggplant: NSObject, Veggies {
    
    func toString() -> String { "Eggplant" }
}

class Garlic: NSObject, Veggies {
    
    func toString() -> String { "Garlic" }
}

class Mushroom: NSObject, Veggies {

    func toString() -> String { "Mushrooms" }
}
