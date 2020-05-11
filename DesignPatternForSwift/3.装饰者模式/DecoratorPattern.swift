//
//  DecoratorPattern.swift
//  DesignPatternForSwift
//
//  Created by NeroXie on 2020/5/12.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

class DecoratorPattern {
    
    class func test() {
        let beverage1: Beverage = Espresso()
        debugPrint("\(beverage1.getDescription()), $\(beverage1.cost())" )
        
        // 深度烘焙摩卡奶泡饮料
        // 创建深度烘焙
        var beverage2: Beverage = DrakRoast()
        // 通过深烘咖啡创建摩卡
        beverage2 = Mocha(beverage: beverage2)
        // 加奶泡
        beverage2 = Whip(beverage: beverage2)
        debugPrint("\(beverage2.getDescription()), $\(beverage2.cost())" )
    }
}
