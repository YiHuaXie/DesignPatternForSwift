//
//  PizzaStore.swift
//  AbstractFactory
//
//  Created by NeroXie on 2020/5/17.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

protocol PizzaStore {
        
    func createPizza(_ type: PizzaType) -> Pizza
}

extension PizzaStore {
    
    func orderPizza(_ type: PizzaType) -> Pizza {
        let pizza = createPizza(type)
        print("--- Making a \(pizza.name) ---")
        pizza.prepare()
        pizza.bake()
        pizza.cut()
        pizza.box()
        
        return pizza
    }
}

class ChicagoPizzaStore: NSObject, PizzaStore {
        
    func createPizza(_ type: PizzaType) -> Pizza {
        let ingredientFactory = ChicagoPizzaIngredientFactory()
        var pizza: Pizza
        
        switch type {
        case .cheese:
            pizza = CheesePizza(ingredientFactory: ingredientFactory)
            pizza.name = "Chicago Style Cheese Pizza"
        case .veggie:
            pizza = VeggiePizza(ingredientFactory: ingredientFactory)
            pizza.name = "Chicago Style Veggie Pizza"
        case .clam:
            pizza = ClamPizza(ingredientFactory: ingredientFactory)
            pizza.name = "Chicago Style Clam Pizza"
        case .pepperoni:
            pizza = PepperoniPizza(ingredientFactory: ingredientFactory)
            pizza.name = "Chicago Style Pepperoni Pizza"
        }
        
        return pizza
    }
}

class NYPizzaStore: NSObject, PizzaStore {
        
    func createPizza(_ type: PizzaType) -> Pizza {
        let ingredientFactory = NYPizzaIngredientFactory()
        var pizza: Pizza
        
        switch type {
        case .cheese:
            pizza = CheesePizza(ingredientFactory: ingredientFactory)
            pizza.name = "NY Style Cheese Pizza"
        case .veggie:
            pizza = VeggiePizza(ingredientFactory: ingredientFactory)
            pizza.name = "NY Style Veggie Pizza"
        case .clam:
            pizza = ClamPizza(ingredientFactory: ingredientFactory)
            pizza.name = "NY Style Clam Pizza"
        case .pepperoni:
            pizza = PepperoniPizza(ingredientFactory: ingredientFactory)
            pizza.name = "NY Style Pepperoni Pizza"
        }
        
        return pizza
    }
}
