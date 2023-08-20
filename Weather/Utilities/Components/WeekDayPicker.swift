//
//  WeekDayPicker.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 16.06.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

class WeekDayPicker: UIControl {
    // MARK: - Properties
    private var selectedDay: String? = nil {
        didSet {
            updateSelectedDay()
            sendActions(for: .valueChanged)
        }
    }
    
    private let date = Date()
    private let dateFormatter = DateFormatter()
    private let calendar = Calendar(identifier: .gregorian)
    private let currentLocale = Locale.current.identifier
    
    private var weekDays: [String] = []
    private var buttonDays: [UIButton] = []
    private var stackView: UIStackView!
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    // MARK: - Actions
    @objc private func selectDay(_ sender: UIButton) {
        guard let index = buttonDays.firstIndex(of: sender) else { return }
        selectedDay = weekDays[index]
    }
    
    // MARK: - Private
    private func configureUI() {
        dateFormatter.locale = .init(identifier: currentLocale)
        weekDays = dateFormatter.shortWeekdaySymbols
        
        for (_, index) in weekDays.enumerated() {
            let button = UIButton(type: .system)
            button.setTitle(index, for: .normal)
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.addTarget(self, action: #selector(selectDay(_:)), for: .touchUpInside)
            
            buttonDays.append(button)
        }
        
        stackView = UIStackView(arrangedSubviews: buttonDays)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        
        selectedDay = currentDay()
    }
    
    private func updateSelectedDay() {
        for (index, button) in buttonDays.enumerated() {
            button.isSelected = weekDays[index] == selectedDay
        }
    }
    
    private func currentDay() -> String? {
        if let number = dayOfWeek() {
            return weekDays[number-1]
        }
        
        return nil
    }
    
    private func dayOfWeek() -> Int? {
        let components = calendar.dateComponents([.weekday], from: date)
        let day = components.weekday
        
        return day
    }
}
