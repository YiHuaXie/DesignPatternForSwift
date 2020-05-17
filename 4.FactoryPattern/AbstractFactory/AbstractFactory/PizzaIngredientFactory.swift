//
//  PizzaIngredientFactory.swift
//  AbstractFactory
//
//  Created by NeroXie on 2020/5/17.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

/// 披萨原料工厂
protocol PizzaIngredientFactory {
    
    func createDough() -> Dough
    
    func createSauce() -> Sauce
    
    func createCheese() -> Cheese
    
    func createVeggies() -> [Veggies]
    
    func createPepperoni() -> Pepperoni
    
    func createClam() -> Clams
}


class ChicagoPizzaIngredientFactory: NSObject, PizzaIngredientFactory {
    
    func createDough() -> Dough { ThickCrustDough() }
    
    func createSauce() -> Sauce { PlumTomatoSauce() }
    
    func createCheese() -> Cheese { MozzarellaCheese() }
    
    func createVeggies() -> [Veggies] {
        [BlackOlives(), Spinach(), Eggplant()]
    }
    
    func createPepperoni() -> Pepperoni { SlicedPepperoni() }
    
    func createClam() -> Clams { FrozenClams() }
}

class NYPizzaIngredientFactory: NSObject, PizzaIngredientFactory {
    
    func createDough() -> Dough { ThinCrustDough() }
    
    func createSauce() -> Sauce { MarinaraSauce() }
    
    func createCheese() -> Cheese { ReggianoCheese() }
    
    func createVeggies() -> [Veggies] {
        [Garlic(), Mushroom()]
    }
    
    func createPepperoni() -> Pepperoni { SlicedPepperoni() }
    
    func createClam() -> Clams { FreshClams() }
}
