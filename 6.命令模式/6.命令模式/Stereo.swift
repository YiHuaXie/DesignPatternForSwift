//
//  Stereo.swift
//  6.命令模式
//
//  Created by NeroXie on 2020/5/18.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

class Stereo {

    private var location: String
    
    init(location: String) { self.location = location }
    
    func on() { print(location + " stereo is on") }

    func off() { print(location + " stereo is off") }

    func setCD() { print(location + " stereo is set for CD input") }

    func setDVD() { print(location + " stereo is set for DVD input") }

    func setRadio() { print(location + " stereo is set for Radio") }

    func setVolume(_ volume: Int) {
       print("\(location) Stereo volume set to \(volume)")
    }
}

class StereoOffCommand: Command {
    
    private var stereo: Stereo
    
    init(stereo: Stereo) { self.stereo = stereo }
    
    func execute() { stereo.off() }
    
    func undo() { stereo.on() }
}

class StereoOnCommand: Command {
    
    private var stereo: Stereo
    
    init(stereo: Stereo) { self.stereo = stereo }
    
    func execute() { stereo.on() }
    
    func undo() { stereo.off() }
}

class StereoOnWithCDCommand: Command {
    
    private var stereo: Stereo
    
    init(stereo: Stereo) { self.stereo = stereo }
    
    func execute() {
        stereo.on()
        stereo.setCD()
        stereo.setVolume(11)
    }
    
    func undo() { stereo.off() }
}
