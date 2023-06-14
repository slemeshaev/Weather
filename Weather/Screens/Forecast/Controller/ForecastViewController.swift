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
    
    // MARK: - Properties
    var city: City?
    var weather: Weather? = Weather(temperature: "30°C", icon: "noImage", date: "13.06.2023")
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Private
    private func configureUI() {
        if let city = city {
            configureNavigationBarWithTitle(city.name)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension ForecastViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as? ForecastCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if let weather = weather {
            let model = ForecastViewCellModel(weather: weather)
            cell.configure(with: model)
        }
        
        return cell
    }
}
