//
//  AddCityViewController.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 27.05.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

class AddCityViewController: UIViewController {
    private let reuseId = "AddCityCell"
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    private var cityList = CityList(cityList: [])
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Private
    private func createCityList() -> CityList {
        let volgograd = City(icon: UIImage(named: "voronezh")!, name: "Volgograd")
        let belgorod = City(icon: UIImage(named: "moscow")!, name: "Belgorod")
        let khabarovsk = City(icon: UIImage(named: "samara")!, name: "Khabarovsk")
        return CityList(cityList: [volgograd, belgorod, khabarovsk])
    }
    
    private func configureUI() {
        cityList = createCityList()
    }
}

// MARK: - UITableViewDataSource
extension AddCityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let city = cityList.cityAtIndex(index: indexPath.row) else {
            return UITableViewCell()
        }
        
        let addCityViewCellModel = AddCityViewCellModel(city: city)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? AddCityViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: addCityViewCellModel)
        
        return cell
    }
}
