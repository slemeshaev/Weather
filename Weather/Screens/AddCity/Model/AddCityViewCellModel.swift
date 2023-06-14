//
//  AddCityViewCellModel.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 05.06.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

struct AddCityViewCellModel {
    // MARK: - Init
    init(city: City) {
        self.city = city
    }
    
    // MARK: - Properties
    private let city: City
    
    var iconImage: String {
        return city.icon
    }
    
    var cityName: String {
        return city.name
    }
}
