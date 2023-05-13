//
//  String+Color.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 13.05.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

extension String {
    /// Returns an instance of color loaded from bundle by the name equals to this string
    var uiColor: UIColor {
        return UIColor(named: self) ?? UIColor()
    }
}
