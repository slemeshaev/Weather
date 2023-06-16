//
//  WeekDayPicker.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 16.06.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

enum Day: Int {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    
    static let weekDays: [Day] = [monday, tuesday, wednesday, thursday, friday, saturday, sunday]
    
    var title: String {
        switch self {
            case .monday:
                return "WeekDayPicker.Monday".localized
            case .tuesday:
                return "WeekDayPicker.Tuesday".localized
            case .wednesday:
                return "WeekDayPicker.Wednesday".localized
            case .thursday:
                return "WeekDayPicker.Thursday".localized
            case .friday:
                return "WeekDayPicker.Friday".localized
            case .saturday:
                return "WeekDayPicker.Saturday".localized
            case .sunday:
                return "WeekDayPicker.Sunday".localized
        }
    }
}

class WeekDayPicker: UIControl {
    // MARK: - Properties
    private var selectedDay: Day? = nil {
        didSet {
            updateSelectedDay()
            sendActions(for: .valueChanged)
        }
    }
    
    private var buttons: [UIButton] = []
    private var stackView: UIStackView!
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    // MARK: - Actions
    @objc private func selectDay(_ sender: UIButton) {
        guard let index = buttons.firstIndex(of: sender) else { return }
        guard let day = Day(rawValue: index) else { return }
        
        selectedDay = day
    }
    
    // MARK: - Private
    private func setupView() {
        for day in Day.weekDays {
            let button = UIButton(type: .system)
            button.setTitle(day.title, for: .normal)
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.addTarget(self, action: #selector(selectDay(_:)), for: .touchUpInside)
            buttons.append(button)
        }
        
        stackView = UIStackView(arrangedSubviews: buttons)
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
    }
    
    private func updateSelectedDay() {
        for (index, button) in buttons.enumerated() {
            guard let day = Day(rawValue: index) else { continue }
            button.isSelected = day == selectedDay
        }
    }
}
