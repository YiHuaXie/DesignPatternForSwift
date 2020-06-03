//
//  TV.swift
//  6.命令模式
//
//  Created by NeroXie on 2020/5/18.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

class TV {
    
    private var location: String
    
    var channel: Int = 0

    init(location: String) { self.location = location }

    func on() { print(location + " TV is on") }

    func off() { print(location + " TV is off") }

    func setInputChannel() {
        channel = 3
        print(location + " TV channel is set for DVD")
    }
}

class TVOffCommand: Command {
    
    private var tv: TV

    init(tv: TV) { self.tv = tv }

    func execute() { tv.off() }

    func undo() { tv.on() }
}

class TVOnCommand: Command {
    
    private var tv: TV
    
    init(tv: TV) { self.tv = tv }
    
    func execute() {
        tv.on()
        tv.setInputChannel()
    }
    
    func undo() { tv.off() }
}
