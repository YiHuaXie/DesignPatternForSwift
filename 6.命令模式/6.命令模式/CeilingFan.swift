//
//  CeilingFan.swift
//  6.命令模式
//
//  Created by NeroXie on 2020/5/18.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

class CeilingFan {
    
    static var LOW: Int { 0 }
    
    static var MEDIUM: Int { 1 }
    
    static var HIGH: Int { 2 }
    
    private var location = ""
    
    private var level = 0
    
    var speed: Int { level }
    
    init(location: String) {
        self.location = location
    }
    
    func high() {
        level = CeilingFan.LOW
        print(location + " ceiling fan is on high")
    }

    func medium() {
        level = CeilingFan.MEDIUM
        print(location + " ceiling fan is on medium")
    }

    func low() {
        level = CeilingFan.LOW
        print(location + " ceiling fan is on low")
    }
 
    func off() {
        level = 0
        print(location + " ceiling fan is off")
    }
}

class CeilingFanHighCommand: Command {
    
    private var ceilingFan: CeilingFan
    
    private var prevSpeed: Int = 0
    
    init(ceilingFan: CeilingFan) { self.ceilingFan = ceilingFan }
    
    func execute() {
        prevSpeed = ceilingFan.speed
        ceilingFan.high()
    }
    
    func undo() {
        switch (prevSpeed) {
        case CeilingFan.HIGH:
            ceilingFan.high()
        case CeilingFan.MEDIUM:
            ceilingFan.medium()
        case CeilingFan.LOW:
            ceilingFan.low()
        default:
            ceilingFan.off()
        }
    }
}

class CeilingFanMeduimCommand: Command {
    
    private var ceilingFan: CeilingFan
    
    private var prevSpeed: Int = 0
    
    init(ceilingFan: CeilingFan) { self.ceilingFan = ceilingFan }
    
    func execute() {
        prevSpeed = ceilingFan.speed
        ceilingFan.medium()
    }
    
    func undo() {
        switch (prevSpeed) {
        case CeilingFan.HIGH:
            ceilingFan.high()
        case CeilingFan.MEDIUM:
            ceilingFan.medium()
        case CeilingFan.LOW:
            ceilingFan.low()
        default:
            ceilingFan.off()
        }
    }
}

class CeilingFanOffCommand: Command {
    
    private var ceilingFan: CeilingFan
    
    private var prevSpeed: Int = 0
    
    init(ceilingFan: CeilingFan) { self.ceilingFan = ceilingFan }
    
    func execute() {
        prevSpeed = ceilingFan.speed
        ceilingFan.off()
    }
    
    func undo() {
        switch (prevSpeed) {
        case CeilingFan.HIGH:
            ceilingFan.high()
        case CeilingFan.MEDIUM:
            ceilingFan.medium()
        case CeilingFan.LOW:
            ceilingFan.low()
        default:
            ceilingFan.off()
        }
    }
}

