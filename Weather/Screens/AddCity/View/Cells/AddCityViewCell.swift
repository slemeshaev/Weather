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
    @IBOutlet private weak var iconView: UIImageView! {
        didSet {
            iconView.layer.borderColor = Color.ContentSecondary.Text.title.cgColor
            iconView.layer.borderWidth = 2
        }
    }
    
    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = Color.ContentSecondary.Text.title
        }
    }
    
    // MARK: - Lifecycle
    override func prepareForReuse() {
        super.prepareForReuse()
        iconView.image = nil
        titleLabel.text = nil
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        iconView.clipsToBounds = true
        iconView.layer.cornerRadius = iconView.bounds.width / 2.0
    }
    
    // MARK: - Interface
    func configure(with model: AddCityViewCellModel) {
        iconView.image = UIImage(named: model.iconImage)
        titleLabel.text = model.cityName
    }
}
