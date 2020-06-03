//
//  Command.swift
//  6.命令模式
//
//  Created by NeroXie on 2020/5/18.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

protocol Command {
    
    func execute()
    
    func undo()
}

class MacroCommand: Command {
    
    private var commands: [Command]
    
    init(commands: [Command]) { self.commands = commands }
    
    func execute() {
        commands.forEach { $0.execute() }
    }
    
    func undo() {
        commands.forEach { $0.undo() }
    }
}

class NoCommand: Command {
    
    init() {}
    
    func execute() {}
    
    func undo() {}
}
