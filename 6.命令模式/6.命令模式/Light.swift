//
//  Light.swift
//  6.命令模式
//
//  Created by NeroXie on 2020/5/18.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

class Light {
    
    private var location: String
    
    var level: Int = 0
    
    init(location: String) { self.location = location }
    
    func on() {
        level = 100
        print("Light is on")
    }
    
    func off() {
        level = 0
        print("Light is off")
    }
    
    func dim(level: Int) {
        self.level = level
        
        if (level == 0) {
            off()
        } else {
            print("Light is dimmed to \(level)%")
        }
    }
}

class LightOnCommand: Command {
    
    private var light: Light
    
    init(light: Light) { self.light = light }
    
    func execute() { light.on() }
    
    func undo() { light.off() }
}

class LightOffCommand: Command {
    
    private var light: Light
    
    init(light: Light) { self.light = light }
    
    func execute() { light.off() }
    
    func undo() { light.on() }
}

class LivingroomLightOffCommand: Command {
    
    private var light: Light
    
    init(light: Light) { self.light = light }
    
    func execute() {
        light.off()
    }
    
    func undo() {
        light.on()
    }
}

class LivingroomLightOnCommand: Command {
    
    private var light: Light
    
    init(light: Light) { self.light = light }
    
    func execute() {
        light.on()
    }
    
    func undo() {
        light.off()
    }
}
