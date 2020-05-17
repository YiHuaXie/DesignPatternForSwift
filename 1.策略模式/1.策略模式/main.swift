//
//  main.swift
//  1.策略模式
//
//  Created by NeroXie on 2020/5/17.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

let mallard: Duck = MallardDuck()
mallard.performFly()
mallard.performQuack()

print("--------- 改变后 -----------")
mallard.flyBehavior = FlyWithWings()
mallard.quackBehavior = Squeak()

mallard.performFly()
mallard.performQuack()

