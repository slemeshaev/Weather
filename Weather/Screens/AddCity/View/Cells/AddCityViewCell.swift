//
//  AddCityViewCell.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 05.06.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

class AddCityViewCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet private weak var iconView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: - Interface
    func configure(with model: AddCityViewCellModel) {
        iconView.image = UIImage(named: model.iconImage)
        titleLabel.text = model.cityName
    }
}
