//
//  Weather.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 13.06.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import Foundation

struct Weather: Codable {
    // MARK: - Properties
    let icon: String
    let temperature: Double
    let date: Date
    
    // MARK: - Init
    init(icon: String, temperature: Double, date: Date) {
        self.icon = icon
        self.temperature = temperature
        self.date = date
    }
    
    init() {
        self.init(icon: String(), temperature: Double(), date: Date())
    }
}
