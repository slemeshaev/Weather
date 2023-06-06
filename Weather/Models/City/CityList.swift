//
//  CityList.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 14.05.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import Foundation

class CityList {
    // MARK: - Init
    init(cityList: [City]) {
        self.cityList = cityList
    }
    
    // MARK: - Properties
    private var cityList: [City]
    
    var cities: [City] {
        return cityList
    }
    
    var count: Int {
        return cityList.count
    }
    
    // MARK: - Interface
    func addCity(city: City) {
        if !city.name.isEmpty {
            cityList.append(city)
        }
    }
    
    func cityAtIndex(index: Int) -> City? {
        if (index < 0 || index > cities.count - 1) {
            return nil
        }
        
        return cityList[index]
    }
    
    func removeCity(city: City) {
        if let index = cityList.firstIndex(of: city) {
            cityList.remove(at: index)
        }
    }
}
