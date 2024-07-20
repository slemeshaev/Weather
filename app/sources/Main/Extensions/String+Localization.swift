//
//  String+Localization.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 12.05.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import Foundation

/// The list of all available localizable files
enum LocalizableFile: String {
    case main
    
    var fileName: String {
        switch self {
            case .main: return "Localizable"
        }
    }
}

extension String {
    /// Returns localized string from Localizable.strings file
    var localized: String {
        return localized(file: .main)
    }
    
    /// Returns localized string from the given file
    func localized(file: LocalizableFile) -> String {
        return NSLocalizedString(self, tableName: file.fileName, comment: "")
    }
    
    /// Returns localized string from Localizable.strings file with the given format
    func localized(_ args: CVarArg...) -> String {
        return String(format: localized, arguments: args)
    }
    
    /// Returns localized string from the given file by the given key considering the given parameters
    func localized(_ args: CVarArg..., file: LocalizableFile? = nil) -> String {
        if let file = file {
            return String(format: localized(file: file), arguments: args)
        } else {
            return String(format: localized, arguments: args)
        }
    }
}
