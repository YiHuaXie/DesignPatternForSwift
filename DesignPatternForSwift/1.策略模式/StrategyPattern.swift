//
//   StrategyPattern.swift
//  DesignPatternForSwift
//
//  Created by NeroXie on 2020/5/7.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

class StrategyPattern {
    
    class func test() {
        let mallard: Duck = MallardDuck()
        mallard.performFly()
        mallard.performQuack()
        
        print("--------- 改变后 -----------")
        mallard.flyBehavior = FlyWithWings()
        mallard.quackBehavior = Squeak()
        
        mallard.performFly()
        mallard.performQuack()
    }
}

