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
    @IBOutlet private weak var iconView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: - Interface
    func configure(with model: CityListViewCellModel) {
        iconView.image = UIImage(named: model.iconImage)
        titleLabel.text = model.cityName
    }
}
