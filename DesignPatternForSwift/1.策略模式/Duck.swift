//
//  Duck.swift
//  DesignPatternForSwift
//
//  Created by NeroXie on 2020/5/7.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

// 所有飞行类都实现它，所有新的飞行类都必须实现fly()方法。
protocol FlyBehavior {
    
    func fly()
}

// 呱呱叫行为也一样，只包含一个需要实现的quack()方法
protocol QuackBehavior {
    
    func quack()
}

// 实现了所有有翅膀的鸭子飞行动作
class FlyWithWings: NSObject, FlyBehavior {
    
    func fly() { print("鸭子飞行") }
}

// 实现了所有不会飞的鸭子的动作
class FlyNoWay: NSObject, FlyBehavior {
    
    func fly() { print("不会飞") }
}

// 实现鸭子呱呱叫
class Quack: NSObject, QuackBehavior {
    
    func quack() { print("鸭子呱呱叫") }
}

// 名为呱呱叫，其实是吱吱叫
class Squeak: NSObject, QuackBehavior {
    
    func quack() { print("橡皮鸭子吱吱叫") }
}

// 名为呱呱叫，其实不出声
class MuteQuack: NSObject, QuackBehavior {
    
    func quack() {}
}

// Duck类是所有鸭子的父类
class Duck: NSObject {
    
    var flyBehavior: FlyBehavior?
    
    var quackBehavior: QuackBehavior?
    
    func performFly() { flyBehavior?.fly() }
    
    func performQuack() { quackBehavior?.quack() }
    
    func swim() { print("swim") }
}

class MallardDuck: Duck {
    
    override init() {
        super.init()
        
        // 绿头鸭使用Quack类处理呱呱叫，所以当performQuack()被调用，就把责任委托给Quack对象进行真正的呱呱叫。
        flyBehavior = FlyNoWay()
        quackBehavior = Quack()
    }
}



