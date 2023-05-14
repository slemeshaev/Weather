//
//  CityListViewController.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 09.05.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

class CityListViewController: UIViewController {
    private let kCityListCell = "CityListCell"
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    private var cityList = CityList(cityList: [])
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cityList = createCityList()
    }
    
    // MARK: - Private
    private func createCityList() -> CityList {
        let voronezh = City(icon: UIImage(named: "voronezh")!, name: "Voronezh")
        let moscow = City(icon: UIImage(named: "moscow")!, name: "Moscow")
        let samara = City(icon: UIImage(named: "samara")!, name: "Samara")
        return CityList(cityList: [voronezh, moscow, samara])
    }
}

// MARK: - UITableViewDataSource
extension CityListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let city = cityList.cityAtIndex(index: indexPath.row) else {
            return UITableViewCell()
        }
        
        let cityListViewCellModel = CityListViewCellModel(city: city)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kCityListCell, for: indexPath) as? CityListViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: cityListViewCellModel)
        
        return cell
    }
}
