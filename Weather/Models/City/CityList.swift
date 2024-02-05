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
    init(_ list: [City]) {
        self.list = list
    }
    
    // MARK: - Properties
    private var list: [City]
    
    var cities: [City] {
        return list
    }
    
    var count: Int {
        return list.count
    }
    
    // MARK: - Interface
    func addCity(city: City) {
        if !city.name.isEmpty {
            list.append(city)
        }
    }
    
    func cityAtIndex(index: Int) -> City? {
        if (index < 0 || index > cities.count - 1) {
            return nil
        }
        
        return list[index]
    }
    
    func removeCity(city: City) {
        if let index = list.firstIndex(of: city) {
            list.remove(at: index)
        }
    }
    
    func hasCity(_ city: City) -> Bool {
        return list.firstIndex(of: city) == nil
    }
}
