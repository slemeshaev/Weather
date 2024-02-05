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
    init(list: WeatherList) {
        self.weatherList = list
    }
    
    // MARK: - Properties
    private let weatherList: WeatherList
    
    private let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yyyy HH.mm"
        return df
    }()
    
    private var weather: Weather {
        for value in weatherList.weathers {
            return Weather(icon: value.icon, temperature: value.temperature, date: value.date)
        }
        
        return Weather()
    }
    
    var icon: String { weather.icon }
    var temperature: String { String(weather.temperature) }
    var date: String { dateFormatter.string(from: weather.date) }
}
