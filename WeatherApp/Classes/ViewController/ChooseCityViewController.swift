//
//  ChooseCityViewController.swift
//  WeatherApp
//
//  Created by Hrayr Yeghiazaryan on 04/03/2019.
//  Copyright © 2019 Hrayr Yeghiazaryan. All rights reserved.
//

import UIKit

class ChooseCityViewController: UIViewController {

    let citiesNames = [UIConstants.yerevan,
                      UIConstants.berlin,
                      UIConstants.paris,
                      UIConstants.saintPeterburg,
                      UIConstants.newYork]
    let citiesCoordinates = [UIConstants.yerevanCoordinates,
                             UIConstants.berlinCoordinates,
                             UIConstants.parisCoordinates,
                             UIConstants.saintPeterburgCoordinates,
                             UIConstants.newYorkCoordinates]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureTableView()
        // Do any additional setup after loading the view.
    }

    func configureNavigationBar() {
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.barTintColor = .white
    }

    func configureTableView() {
        tableView.register(UINib(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "cityCell")
    }

    func pushNextViewController() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(loginViewController, animated: true)
    }

}

extension ChooseCityViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesNames.count
    }
}

extension ChooseCityViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityTableViewCell
        let cityName = citiesNames[indexPath.row]
        cell.configureCell(with: cityName)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        APIConstants.cityCoordinates = citiesCoordinates[indexPath.row]
        UIConstants.chosenCity = citiesNames[indexPath.row]
        pushNextViewController()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
