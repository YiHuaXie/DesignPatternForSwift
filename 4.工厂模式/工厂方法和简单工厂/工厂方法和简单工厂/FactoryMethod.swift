//
//  AbstractFactory.swift
//  DesignPatternForSwift
//
//  Created by NeroXie on 2020/5/12.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

fileprivate protocol Pizza {
    
    var name: String { get set }
    
    var dough: String { get set }
    
    var sauce: String { get set }
    
    var toppings: [String] { get set }
    
    func prepare()
    
    func bake()
    
    func cut()
    
    func box()
}

extension Pizza {
    
    func prepare() {
        debugPrint("Preparing" + name)
        debugPrint("Tossing dough...")
        debugPrint("Adding sauce...")
        debugPrint("Adding toppings:")
        for element in toppings { debugPrint("    " + element) }
    }
    
    func bake() { debugPrint("Bake for 25 min at 350") }
    
    func cut() { debugPrint("Cutting the pizza into diagonal slices") }
    
    func box() { debugPrint("Place pizza in official PizzaStore box") }
    
    func getName() -> String { name }
}

fileprivate protocol PizzaStore {
    
    func createPizza(_ type: String) -> Pizza?
}

extension PizzaStore {
    
    func orderPizza(_ type: String) -> Pizza? {
        let pizza: Pizza? = createPizza(type)
        pizza?.prepare()
        pizza?.bake()
        pizza?.cut()
        pizza?.box()
        
        return pizza
    }
}

fileprivate class NYStylePizzaStore: PizzaStore {
    
    func createPizza(_ type: String) -> Pizza? {
        switch type {
        case "cheese": return NYStyleCheesePizza()
        default: return nil
        }
    }
}

fileprivate class ChicagoStylePizzaStore: PizzaStore {
    
    func createPizza(_ type: String) -> Pizza? {
        switch type {
        case "cheese": return ChicagoStyleCheesePizza()
        default: return nil
        }
    }
}

fileprivate class NYStyleCheesePizza: Pizza {
    
    var name = "NY Style Sauce and Cheese Pizza"
    
    var dough = "Thin Crust Dough"
    
    var sauce = "Marinara Sauce"
    
    var toppings = ["Grated Reggiano Cheese"]
    
    init() {}
}

fileprivate class ChicagoStyleCheesePizza: Pizza {
    
    var name = "Chicago Style Deep Dish Cheese Pizza"
    
    var dough = "Extra Thick Crust Dough"
    
    var sauce = "Plum Tomato Sauce"
    
    var toppings = ["Shredded Mozzarella Cheese"]
    
    init() {}
    
    func cut() { debugPrint("Cutting the pizza into square slices") }
}

func factoryTest() {
    let store1 = NYStylePizzaStore()
    let pizza1 = store1.orderPizza("cheese")
    debugPrint("Ethan ordered a \(pizza1?.getName() ?? "")")
    
    let store2 = ChicagoStylePizzaStore()
    let pizza2  = store2.orderPizza("cheese")
    debugPrint("Joel ordered a \(pizza2?.getName() ?? "")")
}

