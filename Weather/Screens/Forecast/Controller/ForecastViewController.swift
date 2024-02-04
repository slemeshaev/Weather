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
    
    // MARK: - Properties
    private let dataFetcher = NetworkDataFetcher()
    private var weathers = [Weather]()
    
    var city: City?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Private
    private func configureUI() {
        guard let city = city?.name else { return }
        
        configureNavigationBarWithTitle(city)
        dataFetcher.fetchWeather(for: city) { (weatherResults) in
            guard let fetchedWeather = weatherResults else { return }
            
            fetchedWeather.list.forEach { weather in
                self.weathers.append(Weather(dto: weather))
            }
            
            self.collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension ForecastViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weathers.count - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as? ForecastCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let weather = weathers[indexPath.row]
        let model = ForecastViewCellModel(weather: weather)
        
        cell.configure(with: model)
        
        return cell
    }
}
