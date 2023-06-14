//
//  City.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 14.05.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import Foundation

struct City: Equatable {
    let icon: String
    let name: String
    
    // MARK: - Equatable
    static func == (lhs: City, rhs: City) -> Bool {
        return lhs.name == rhs.name
    }
}
