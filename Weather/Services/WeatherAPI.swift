//
//  WeatherAPI.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 02.02.2024.
//  Copyright © 2024 slemeshaev. All rights reserved.
//

struct WeatherAPI {
    static let scheme = "https"
    static let host = "api.openweathermap.org"
    #warning("You need to paste your own Api Key...")
    static let apiKey = "<Api Key>"
    static let path = "/data/2.5/forecast"
}
