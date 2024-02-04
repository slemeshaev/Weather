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
    
    private let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yyyy HH.mm"
        return df
    }()
    
    var weatherIcon: String {
        return weather.icon
    }
    
    var weatherTemperature: String {
        return weather.temperature.formatted()
    }
    
    var date: String {
        return weather.date.formatted()
    }
}
