//
//  SimpleFactory.swift
//  DesignPatternForSwift
//
//  Created by NeroXie on 2020/5/12.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

fileprivate class Pizza {

    init() {}
    
    func prepare() {}
    
    func bake() {}
    
    func cut() {}
    
    func box() {}
}

fileprivate class CheesePizza: Pizza {}

fileprivate class PepperoniPizza: Pizza {}

fileprivate class ClamPizza: Pizza {}

fileprivate class VeggiePizza: Pizza {}

fileprivate class SimplePizzaFactory: NSObject {
    
    func createPizza(_ type: String) -> Pizza? {
        var pizza: Pizza? = nil
        
        switch type {
        case "cheese": pizza = CheesePizza()
        case "pepperoni": pizza = PepperoniPizza()
        case "clam": pizza = ClamPizza()
        case "veggie": pizza = VeggiePizza()
        default: break
        }
        
        return pizza
    }
}

fileprivate class PizzaStore {
    
    var factory: SimplePizzaFactory
    
    init(factory: SimplePizzaFactory) {
        self.factory = factory
    }
    
    func orderPizza(_ type: String) -> Pizza? {
        let pizza: Pizza? = factory.createPizza(type)
        pizza?.prepare()
        pizza?.bake()
        pizza?.cut()
        pizza?.box()
        
        return pizza
    }
}

func simpleFactoryTest() {
    let simpleFactory = SimplePizzaFactory()
    let store = PizzaStore(factory: simpleFactory)
    let pizza: Pizza? = store.orderPizza("cheese")
}
