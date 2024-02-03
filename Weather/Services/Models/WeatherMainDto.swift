//
//  WeatherMainDto.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 03.02.2024.
//  Copyright © 2024 slemeshaev. All rights reserved.
//

import Foundation

struct WeatherMainDto: Decodable {
    let temp: Double
    let feels_like: Double
    let pressure: Int
    let humidity: Int
}
