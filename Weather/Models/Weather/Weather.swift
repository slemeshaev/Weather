//
//  Weather.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 13.06.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import Foundation

struct WeatherResponse: Decodable {
    let list: [Weather]
}

struct Weather: Decodable {
    let temperature: String
    let icon: String
    let date: String
}
