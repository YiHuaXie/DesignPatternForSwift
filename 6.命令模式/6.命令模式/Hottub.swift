//
//  Hottub.swift
//  6.命令模式
//
//  Created by NeroXie on 2020/5/18.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

class Hottub {
    
    private var _on: Bool = false
    
    private var temperature: Int = 0

    func on() { _on = true }

    func off() { _on = false }

    func circulate() {
        if (_on) { print("Hottub is bubbling!") }
    }
    
    func jetsOn() {
        if (_on) { print("Hottub jets are on") }
    }

    func jetsOff() {
        if (_on) { print("Hottub jets are off") }
    }

    func setTemperature(_ temperature: Int) {
        if (temperature > self.temperature) {
            print("Hottub is heating to a steaming \(temperature) degrees")
        } else {
            print("Hottub is cooling to \(temperature) degrees")
        }
       
        self.temperature = temperature;
    }
}

class HottubOffCommand: Command {
    
    private var hottub: Hottub

    init(hottub: Hottub) { self.hottub = hottub }

    func execute() {
        hottub.setTemperature(98)
        hottub.off()
    }
    
    func undo() {
        hottub.on()
    }
}

class HottubOnCommand: Command {
    
    private var hottub: Hottub

    init(hottub: Hottub) { self.hottub = hottub }

    func execute() {
        hottub.on();
        hottub.setTemperature(104)
        hottub.circulate()
    }
    
    func undo() {
        hottub.off()
    }
}
