//
//  ForecastCollectionViewCell.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 13.06.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

class ForecastCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var iconView: UIImageView!
    @IBOutlet private weak var dateLabel: UILabel!
    
    // MARK: - Interface
    func configure(with model: ForecastViewCellModel) {
        temperatureLabel.text = model.weatherTemperature
        iconView.image = model.weatherIcon
        dateLabel.text = model.date
    }
}
