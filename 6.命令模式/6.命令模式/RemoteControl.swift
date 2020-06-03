//
//  RemoteControl.swift
//  6.命令模式
//
//  Created by NeroXie on 2020/5/18.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

class RemoteControl {
    
    var onCommands: [Command] = []
    
    var offCommands: [Command] = []
    
    var undoCommand: Command
    
    init() {
        for _ in 0..<7 {
            self.onCommands.append(NoCommand())
            self.offCommands.append(NoCommand())
        }
        
        self.undoCommand = NoCommand()
    }
    
    func setCommand(slot: Int, onCommand: Command, offCommand: Command) {
        onCommands[slot] = onCommand
        offCommands[slot] = offCommand
    }
    
    func onButtonWasPushed(slot: Int) {
        onCommands[slot].execute()
        undoCommand = onCommands[slot]
    }
    
    func offButtonWasPushed(slot: Int) {
        offCommands[slot].execute()
        undoCommand = offCommands[slot]
    }
    
    func undoButtonWasPushed() {
        undoCommand.undo()
    }

    func toString() -> String {
        var elements: [String] = ["\n------ Remote Control -------\n"]
        
        for i in 0..<onCommands.count {
            elements.append("[slot \(i)] \(type(of: onCommands[i])) \(type(of: offCommands[i]))\n")
        }

        return elements.joined(separator: "")
    }
}
