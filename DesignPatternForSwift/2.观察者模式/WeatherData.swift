//
//  WeatherData.swift
//  DesignPatternForSwift
//
//  Created by NeroXie on 2020/5/8.
//  Copyright © 2020 NeroXie. All rights reserved.
//

import Foundation

// 主题接口
protocol Subject {
    
    func registerObserver(_ observer: Observer)
    
    func removeObserver(_ observer: Observer)
    
    func notifyObservers()
}

// 观察者：所有潜在的观察者必须实现观察者接口，这个接口只有update()一个方法，当主题状态改变时它被调用。
protocol Observer {
    
    var identifier: String { get }
    
    func update(temp: Float, humidity: Float, pressure: Float)
}

// 布告板用来展示的接口，只需要实现display()方法。
protocol DisplayElement {
    
    func display()
}

// WeatherData中实现主题接口
class WeatherData: NSObject, Subject {

    private var observers: [Observer] = []
    
    private var temperature: Float = 0.0
    
    private var humidity: Float = 0.0
    
    private var pressure: Float = 0.0
    
    func registerObserver(_ observer: Observer) {
        observers.append(observer)
    }
    
    func removeObserver(_ observer:Observer) {
        if let index = observers.firstIndex(where: { $0.identifier == observer.identifier }) {
            observers.remove(at: index)
        }
    }
    
    func notifyObservers() {
        for observer in observers {
            observer.update(temp: temperature, humidity: humidity, pressure: pressure)
        }
    }
    
    func setMeasurements(temperature: Float, humidity: Float, pressure: Float) {
        self.temperature = temperature
        self.humidity = humidity
        self.pressure = pressure
        notifyObservers()
    }
    
    // 其他方法
}

// MARK: - 设置布告板

class CurrentConditionsDisplay: NSObject, Observer, DisplayElement {
    
    var identifier: String { "a" }
    
    private var temperature: Float = 0.0
    
    private var humidity: Float = 0.0
    
    private var weatherData: Subject!
    
    convenience init(weatherData: Subject) {
        self.init()
        
        self.weatherData = weatherData
        weatherData.registerObserver(self)
    }
    
    func update(temp: Float, humidity: Float, pressure: Float) {
        self.humidity = humidity
        self.temperature = temp
        
        display()
    }
    
    func display() {
        print("Current conditions: \(temperature)F degrees and \(humidity)")
    }
}

class ForecastDisplay: NSObject, Observer, DisplayElement {
    
    var identifier: String { "b" }
    
    private var pressure: Float = 0.0
    
    private var weatherData: Subject!
    
    convenience init(weatherData: Subject) {
        self.init()
        
        self.weatherData = weatherData
        weatherData.registerObserver(self)
    }
    
    func update(temp: Float, humidity: Float, pressure: Float) {
        self.pressure = pressure
        display()
    }
    
    func display() {
        print("Forecast: \(pressure)")
    }
}

