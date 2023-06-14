//
//  ForecastViewCellModel.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 13.06.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

struct ForecastViewCellModel {
    // MARK: - Init
    init(weather: Weather) {
        self.weather = weather
    }
    
    // MARK: - Properties
    private let weather: Weather
    
    var weatherIcon: String {
        return weather.icon
    }
    
    var weatherTemperature: String {
        return weather.temperature
    }
    
    var date: String {
        return weather.date
    }
}
