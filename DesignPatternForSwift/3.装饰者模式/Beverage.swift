//
//  Beverage.swift
//  DesignPatternForSwift
//
//  Created by NeroXie on 2020/5/11.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

/**
 * 装饰类模式角色：
 * 1.Component（抽象构件）：
 * Component是具体构件和抽象装饰类的共同父类，声明了在具体构件中实现的业务方法。
 * 它的引入可以使客户端以一致的方式处理未被装饰的对象以及装饰之后的对象，实现客户端的透明操作。
 *
 * 2. ConcreteComponent（具体构件）：
 * 它是Component的子类，实现了在抽象构件中声明的方法，是我们将要动态地加上新行为的对象。
 *
 * 3. Decorator（抽象装饰类）：
 * 它也是Component的子类，用于给ConcreteComponent增加职责，但是具体职责在其子类（ConcreteDecorator）中实现。
 * 它维护一个指向Component的引用，通过该引用可以调用ConcreteComponent的方法，并通过其子类扩展该方法，以达到装饰的目的。
 *
 * 4. ConcreteDecorator（具体装饰类）：
 * 它是Decorator的子类，负责向构件添加新的职责。新的职责是通过在旧行为前面或后面做一些计算来添加的
 */

/// Beverage可以理解为Component（抽象构件）
protocol Beverage {
    
    func getDescription() -> String
    
    func cost() -> Double
}

extension Beverage {
    
    func getDescription() -> String { "Unknown Beverage" }
}

/// 浓缩咖啡类是具体构件类
class Espresso: NSObject, Beverage {
    
    func getDescription() -> String { "Espresso" }
    
    func cost() -> Double { 1.99 }
}

/// 家常咖啡是具体构件类
class HouseBlend: NSObject, Beverage {
    
    func getDescription() -> String { "House Blend" }
    
    func cost() -> Double { 0.99 }
}

/// 烘焙咖啡是具体构件类
class DrakRoast: NSObject, Beverage {
    
    func getDescription() -> String { "Drak Roast" }
       
    func cost() -> Double { 0.99 }
}

/// 调料类是Decorator（抽象装饰类），是Component的子类
protocol CondimentDecorator: Beverage {
    
    var beverage: Beverage { set get }
    
    func getDescription() -> String
}

/// 摩卡是具体装饰类（ConcreteDecorator）
class Mocha: CondimentDecorator {
    
    var beverage: Beverage
    
    public init(beverage: Beverage) {
        self.beverage = beverage
    }
    
    func getDescription() -> String {
        beverage.getDescription() + ", Mocha"
    }
    
    func cost() -> Double {
        return 0.20 + beverage.cost()
    }
}

/// 奶泡
class Whip: CondimentDecorator {
    
    var beverage: Beverage
    
    public init(beverage: Beverage) {
        self.beverage = beverage
    }
    
    func getDescription() -> String {
        beverage.getDescription() + ", Whip"
    }
    
    func cost() -> Double {
        return 0.10 + beverage.cost()
    }
}
