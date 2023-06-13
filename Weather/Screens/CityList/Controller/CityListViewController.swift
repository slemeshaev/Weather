//
//  CityListViewController.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 09.05.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

protocol CityListViewControllerDelegate: AnyObject {
    func cityListViewControllerAddCityTapped()
    func cityListViewControllerForecastFor(city: City)
}

class CityListViewController: UIViewController {
    private let reuseId = "CityListCell"
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    private var cityList = CityList(cityList: [])
    
    weak var delegate: CityListViewControllerDelegate?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Actions
    @objc private func addCityTapped() {
        delegate?.cityListViewControllerAddCityTapped()
    }
    
    // MARK: - Interface
    func updateTable(with city: City) {
        if cityList.hasCity(city) {
            cityList.addCity(city: city)
            tableView.reloadData()
        }
    }
    
    // MARK: - Private
    private func createCityList() -> CityList {
        let voronezh = City(icon: UIImage(named: "voronezh")!, name: "Voronezh")
        let moscow = City(icon: UIImage(named: "moscow")!, name: "Moscow")
        let samara = City(icon: UIImage(named: "samara")!, name: "Samara")
        return CityList(cityList: [voronezh, moscow, samara])
    }
    
    private func configureUI() {
        cityList = createCityList()
        configureNavigationBarWithTitle("City List")
        
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCityTapped))
        navigationItem.rightBarButtonItem = item
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate 
extension CityListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let city = cityList.cityAtIndex(index: indexPath.row) else { return }
        delegate?.cityListViewControllerForecastFor(city: city)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let city = cityList.cityAtIndex(index: indexPath.row) else {
            return UITableViewCell()
        }
        
        let cityListViewCellModel = CityListViewCellModel(city: city)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? CityListViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: cityListViewCellModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let city = cityList.cityAtIndex(index: indexPath.row) else { return }
            cityList.removeCity(city: city)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
