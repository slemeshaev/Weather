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
    @IBOutlet private weak var containerView: UIView! {
        didSet {
            containerView.clipsToBounds = true
        }
    }
    
    @IBOutlet private weak var shadowView: UIView! {
        didSet {
            shadowView.layer.shadowOffset = .zero
            shadowView.layer.shadowOpacity = 0.75
            shadowView.layer.shadowRadius = 6
            shadowView.backgroundColor = .clear
        }
    }
    
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var iconView: UIImageView!
    @IBOutlet private weak var dateLabel: UILabel!
    
    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        shadowView.layer.shadowPath = UIBezierPath(ovalIn: shadowView.bounds).cgPath
        containerView.layer.cornerRadius = containerView.frame.width / 2
    }
    
    // MARK: - Interface
    func configure(with model: ForecastViewCellModel) {
        temperatureLabel.text = model.weatherTemperature
        iconView.image = UIImage(named: model.weatherIcon)
        dateLabel.text = model.date
    }
}
