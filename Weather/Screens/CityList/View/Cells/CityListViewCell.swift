//
//  CityListViewCell.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 14.05.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

class CityListViewCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Interface
    func configure(with model: CityListViewCellModel) {
        iconView.image = model.iconImage
        titleLabel.text = model.cityName
    }
}
