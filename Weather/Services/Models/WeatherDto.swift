//
//  WeatherDto.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 03.02.2024.
//  Copyright © 2024 slemeshaev. All rights reserved.
//

import Foundation

struct WeatherDto: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
