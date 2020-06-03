//
//  GarageDoor.swift
//  6.命令模式
//
//  Created by NeroXie on 2020/5/18.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

public class GarageDoor {
    
    private var location = ""
    
    init(location: String) {
        self.location = location
    }

    func up() {
        print(location + " garage Door is Up");
    }

    func down() {
        print(location + " garage Door is Down");
    }

    func stop() {
        print(location + " garage Door is Stopped");
    }

    func lightOn() {
        print(location + " garage light is on");
    }

    func lightOff() {
        print(location + " garage light is off");
    }
}
