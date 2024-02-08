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
    
    var icon: String { weather.icon }
    var temperature: String { "\(Int(round(weather.temperature)))°" }
    var date: String { dateFormatter.string(from: weather.date) }
}
