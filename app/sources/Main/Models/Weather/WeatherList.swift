//
//  WeatherList.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 05.02.2024.
//  Copyright © 2024 slemeshaev. All rights reserved.
//

import Foundation

class WeatherList {
    // MARK: - Init
    init(_ list: [Weather]) {
        self.list = list
    }
    
    // MARK: - Properties
    private var list: [Weather]
    
    var weathers: [Weather] {
        return list
    }
    
    var count: Int {
        return list.count
    }
    
    // MARK: - Interface
    func addWeather(_ weather: Weather) {
        list.append(weather)
    }
    
    func addList(_ list: [WeatherListDto]) {
        list.forEach { weatherList in
            let weather = Weather(icon: weatherList.weather.first?.icon ?? "",
                                  temperature: weatherList.main.temp,
                                  date: weatherList.dt_txt)
            addWeather(weather)
        }
    }
    
    func weatherAtIndex(index: Int) -> Weather? {
        if (index < 0 || index > count - 1) {
            return nil
        }
        
        return list[index]
    }
}
