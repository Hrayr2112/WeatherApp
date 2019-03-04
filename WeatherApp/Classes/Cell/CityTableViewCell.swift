//
//  CityTableViewCell.swift
//  WeatherApp
//
//  Created by Hrayr Yeghiazaryan on 04/03/2019.
//  Copyright © 2019 Hrayr Yeghiazaryan. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(with cityInfo: String) {
        cityNameLabel.text = cityInfo
        flagImageView.image = UIImage(named: cityInfo)
    }
    
}
