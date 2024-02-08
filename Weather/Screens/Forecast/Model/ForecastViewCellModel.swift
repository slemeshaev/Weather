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
    
    var icon: String { weather.icon }
    
    var temperature: String {
        return "\(Int(round(weather.temperature)))°"
    }
    
    var date: String {
        let date = Date.formattedDateString(from: weather.date)
        return Date.formattedDateString(from: date)
    }
}
