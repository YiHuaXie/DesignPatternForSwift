//
//  main.swift
//  2.观察者模式
//
//  Created by NeroXie on 2020/5/17.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

let weatherData = WeatherData()
let currentDisplay = CurrentConditionsDisplay(weatherData: weatherData)
_ = ForecastDisplay(weatherData: weatherData)

weatherData.setMeasurements(temperature: 80, humidity: 65, pressure: 30)
weatherData.setMeasurements(temperature: 70, humidity: 55, pressure: 20)

print("------删除CurrentConditionsDisplay------")
weatherData.removeObserver(currentDisplay)

weatherData.setMeasurements(temperature: 60, humidity: 55, pressure: 10)

