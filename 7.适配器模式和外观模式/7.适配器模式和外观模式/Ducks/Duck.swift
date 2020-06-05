//
//  Duck.swift
//  7.适配器模式和外观模式
//
//  Created by NeroXie on 2020/6/5.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

// 对象适配器

// MARK: - Tatget

// 鸭子
protocol Duck {
    
    func quack()
    
    func fly()
}

// 火鸡
protocol Turkey {
    
    func gobble()
    
    func fly()
}

// 无人机
protocol Drone {
    
    func beep()
    
    func spin_rotors()
    
    func take_off()
}

// MARK: - Adapter

class DuckAdapter: Turkey {
    
    var duck: Duck
    
    init(_ duck: Duck) {
        self.duck = duck
    }
    
    func gobble() { duck.quack() }
    
    func fly() { duck.fly() }
}

class TurkeyAdapter: Duck {
    
    var turkey: Turkey
    
    init(_ turkey: Turkey) {
        self.turkey = turkey
    }
    
    func quack() { turkey.gobble() }
    
    func fly() { turkey.fly() }
}

class DroneAdapter: Duck {
    
    var drone: Drone
    
    init(_ drone: Drone) {
        self.drone = drone
    }
    
    func quack() { drone.beep() }
    
    func fly() {
        drone.spin_rotors()
        drone.take_off()
    }
}

// MARK: - Adaptee

class MallardDuck: NSObject, Duck {
    
    func quack() { print("Quack") }
    
    func fly() { print("I'm flying") }
}

class WildTurkey: NSObject, Turkey {
    
    func gobble() { print("Gobble gobble") }
    
    func fly() { print("I'm flying a short distance") }
}

class SuperDrone: NSObject, Drone {
    
    func beep() { print("Beep beep beep") }
    
    func spin_rotors() { print("Rotors are spinning") }
    
    func take_off() { print("Taking off") }
}

func duckTestDrive() {
    let duck: Duck = MallardDuck()
    let turkey: Turkey = WildTurkey()
    let drone: Drone = SuperDrone()
    
    let turkeyAdapter: Duck = TurkeyAdapter(turkey)
    let droneAdapter: Duck = DroneAdapter(drone)
    
    print("The Turkey says...")
    turkey.gobble()
    turkey.fly()
    
    print("The Duck says...")
    duck.quack()
    duck.fly()
    
    print("The TurkeyAdapter says...")
    turkeyAdapter.quack()
    turkeyAdapter.fly()
    
    print("The DroneAdapter says...")
    droneAdapter.quack()
    droneAdapter.fly()
}

func turkeyTestDrive() {
    let duck: Duck = MallardDuck()
    let duckAdapter: Turkey = DuckAdapter(duck)
    duckAdapter.gobble()
    duckAdapter.fly()
}

// Swift不支持多重继承，要实现类适配器，只能将Adaptee定义成协议（接口）

