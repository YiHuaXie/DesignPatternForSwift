//
//  Pizza.swift
//  AbstractFactory
//
//  Created by NeroXie on 2020/5/17.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

//protocol ToString {
//
//    func toString() -> String
//}

public enum PizzaType: String {
    case cheese, veggie, clam, pepperoni
}

/// 披萨
protocol Pizza {
    
    var name: String { set get }
    
    var dough: Dough? { set get }
    
    var sauce: Sauce? { get set }
    
    var veggies: [Veggies]? { get set }
    
    var cheese: Cheese? { get set }
    
    var pepperoni: Pepperoni? { get set }
    
    var clam: Clams? { get set }
    
    func prepare()
    
    func bake()
    
    func cut()
    
    func box()
}

extension Pizza {
    
    func bake() { print("Bake for 25 minutes at 350") }
    
    func cut() { print("Cutting the pizza into diagonal slices") }
    
    func box() { print("Place pizza in official PizzaStore box") }
    
    func toString() -> String {
        var elements: [String] = [
            dough?.toString() ?? "",
            sauce?.toString() ?? "",
            cheese?.toString() ?? "",
            pepperoni?.toString() ?? "",
            clam?.toString() ?? ""
        ]
        
        for veggie in veggies ?? [] {
            elements.append(veggie.toString())
        }
        
        let string = elements.filter { !$0.isEmpty }.joined(separator: ", ")
        
        return  "\(name): \(string)\n"
    }
}

class CheesePizza: Pizza {
    
    var name: String = ""
    
    var dough: Dough?
    
    var sauce: Sauce?
    
    var veggies: [Veggies]?
    
    var cheese: Cheese?
    
    var pepperoni: Pepperoni?
    
    var clam: Clams?
    
    private var ingredientFactory: PizzaIngredientFactory
    
    init(ingredientFactory: PizzaIngredientFactory) {
        self.ingredientFactory = ingredientFactory
    }
    
    func prepare() {
        print("Preparing " + name)
        dough = ingredientFactory.createDough()
        sauce = ingredientFactory.createSauce()
        cheese = ingredientFactory.createCheese()
    }
}


class VeggiePizza: Pizza {
    
    var name: String = ""
    
    var dough: Dough?
    
    var sauce: Sauce?
    
    var veggies: [Veggies]?
    
    var cheese: Cheese?
    
    var pepperoni: Pepperoni?
    
    var clam: Clams?
    
    private var ingredientFactory: PizzaIngredientFactory
    
    init(ingredientFactory: PizzaIngredientFactory) {
        self.ingredientFactory = ingredientFactory
    }
    
    func prepare() {
        print("Preparing " + name)
        dough = ingredientFactory.createDough()
        sauce = ingredientFactory.createSauce()
        cheese = ingredientFactory.createCheese()
        veggies = ingredientFactory.createVeggies()
    }
}

class ClamPizza: Pizza {
    
    var name: String = ""
    
    var dough: Dough?
    
    var sauce: Sauce?
    
    var veggies: [Veggies]?
    
    var cheese: Cheese?
    
    var pepperoni: Pepperoni?
    
    var clam: Clams?
    
    private var ingredientFactory: PizzaIngredientFactory
    
    init(ingredientFactory: PizzaIngredientFactory) {
        self.ingredientFactory = ingredientFactory
    }
    
    func prepare() {
        print("Preparing " + name)
        dough = ingredientFactory.createDough()
        sauce = ingredientFactory.createSauce()
        cheese = ingredientFactory.createCheese()
        clam = ingredientFactory.createClam()
    }
}

class PepperoniPizza: Pizza {
    
    var name: String = ""
    
    var dough: Dough?
    
    var sauce: Sauce?
    
    var veggies: [Veggies]?
    
    var cheese: Cheese?
    
    var pepperoni: Pepperoni?
    
    var clam: Clams?
    
    private var ingredientFactory: PizzaIngredientFactory
    
    init(ingredientFactory: PizzaIngredientFactory) {
        self.ingredientFactory = ingredientFactory
    }
    
    func prepare() {
        print("Preparing " + name)
        dough = ingredientFactory.createDough()
        sauce = ingredientFactory.createSauce()
        cheese = ingredientFactory.createCheese()
        pepperoni = ingredientFactory.createPepperoni()
    }
}
