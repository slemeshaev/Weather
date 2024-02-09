//
//  ForecastViewController.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 13.06.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {
    private let reuseId = "ForecastCell"
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var weekDayPicker: WeekDayPicker!
    
    // MARK: - Properties
    private let dataFetcher = NetworkDataFetcher()
    private var weatherList = WeatherList([])
    
    var city: City?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Private
    private func configureUI() {
        guard let city = city?.name else { return }
        
        weekDayPicker.delegate = self
        configureNavigationBarWithTitle(city)
        
        dataFetcher.fetchWeather(for: city) { (weatherResults) in
            guard let fetchedWeathers = weatherResults else { return }
            self.weatherList.addList(fetchedWeathers.list)
            self.collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension ForecastViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherList.count - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as? ForecastCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        guard let weather = weatherList.weatherAtIndex(index: indexPath.row) else {
            return UICollectionViewCell()
        }
        
        let model = ForecastViewCellModel(weather: weather)
        cell.configure(with: model)
        
        return cell
    }
}

// MARK: - WeekDayPickerDelegate
extension ForecastViewController: WeekDayPickerDelegate {
    func selectedDayTapped(_ passedDay: String?) {
        print(passedDay ?? String())
    }
}
