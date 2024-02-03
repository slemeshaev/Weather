//
//  WeatherResponse.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 03.02.2024.
//  Copyright © 2024 slemeshaev. All rights reserved.
//

import Foundation

struct WeatherResponse: Decodable {
    let list: [WeatherListDto]
}
