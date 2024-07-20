//
//  Date+Formatter.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 08.02.2024.
//  Copyright © 2024 slemeshaev. All rights reserved.
//

import Foundation

extension Date {
    static func formattedDateString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        return formatter.string(from: date)
    }
    
    static func formattedDateString(from stringDate: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.date(from: stringDate) ?? Date()
    }
}
