//
//  main.swift
//  6.命令模式
//
//  Created by NeroXie on 2020/5/18.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

// Invoker角色
let remoteControl = RemoteControl()

// Receiver角色
let light = Light(location: "Living Room")
let tv = TV(location: "Living Room")
let stereo = Stereo(location: "Living Room")
let hottub = Hottub()

// ConcreteCommand角色
let lightOn = LightOnCommand(light: light)
let stereoOn = StereoOnCommand(stereo: stereo)
let tvOn = TVOnCommand(tv: tv)
let hottubOn = HottubOnCommand(hottub: hottub)

let lightOff = LightOffCommand(light: light)
let stereoOff = StereoOffCommand(stereo: stereo)
let tvOff = TVOffCommand(tv: tv)
let hottubOff = HottubOffCommand(hottub: hottub)

let partyOn: [Command] = [lightOn, stereoOn, tvOn, hottubOn]
let partyOff: [Command] = [lightOff, stereoOff, tvOff, hottubOff]

let partyOnMacro = MacroCommand(commands: partyOn)
let partyOffMacro = MacroCommand(commands: partyOff)

remoteControl.setCommand(slot: 0, onCommand: partyOnMacro, offCommand: partyOffMacro)

print("--- Pushing Macro On ---")
// 调用onButtonWasPushed方法使得该命令的execute方法执行
remoteControl.onButtonWasPushed(slot: 0)
print("--- Pushing Macro Off ---")
remoteControl.offButtonWasPushed(slot: 0)
print("--- Pushing Macro Undo ---")
remoteControl.undoButtonWasPushed()

func execute() {
    receiver.action()
}
