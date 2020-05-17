//
//  main.swift
//  AbstractFactory
//
//  Created by NeroXie on 2020/5/17.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

let store1 = NYPizzaStore()
print(store1.orderPizza(.cheese).toString())
print("")
print(store1.orderPizza(.veggie).toString())
print("")
print(store1.orderPizza(.clam).toString())
print("")
print(store1.orderPizza(.pepperoni).toString())
print("")

let store2 = ChicagoPizzaStore()
print(store2.orderPizza(.cheese).toString())
print("")
print(store2.orderPizza(.veggie).toString())
print("")
print(store2.orderPizza(.clam).toString())
print("")
print(store2.orderPizza(.pepperoni).toString())
print("")

