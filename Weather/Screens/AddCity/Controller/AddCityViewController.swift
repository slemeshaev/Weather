//
//  AddCityViewController.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 27.05.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

protocol AddCityViewControllerDelegate: AnyObject {
    func addCityViewControllerDidSelect(city: City)
}

class AddCityViewController: UIViewController {
    private let reuseId = "AddCityCell"
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    private var cityList = CityList(cityList: [])
    
    weak var delegate: AddCityViewControllerDelegate?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Private
    private func configureUI() {
        cityList = createCityList()
    }
    
    private func createCityList() -> CityList {
        let volgograd = City(icon: "noImage", name: "Volgograd")
        let belgorod = City(icon: "noImage", name: "Belgorod")
        let khabarovsk = City(icon: "noImage", name: "Khabarovsk")
        return CityList(cityList: [volgograd, belgorod, khabarovsk])
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension AddCityViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = AddCityHeaderView()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let city = cityList.cityAtIndex(index: indexPath.row) else { return }
        delegate?.addCityViewControllerDidSelect(city: city)
        tableView.deselectRow(at: indexPath, animated: true)
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