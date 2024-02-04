//
//  Weather.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 13.06.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let icon: String
    let temperature: Double
    let date: Date
}

// MARK: - Mappers
extension Weather {
    init(dto: WeatherListDto) {
        self.icon = dto.weather.first?.icon ?? ""
        self.temperature = dto.main.temp
        self.date = dto.dt
    }
}
