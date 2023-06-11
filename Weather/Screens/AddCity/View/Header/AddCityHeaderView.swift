//
//  AddCityHeaderView.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 08.06.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

class AddCityHeaderView: UIView {
    // MARK: - Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "AddCity.Header.Title".localized
        label.textColor = Color.ContentPrimary.Text.text
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    private func configureUI() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10)
        ])
    }
}
