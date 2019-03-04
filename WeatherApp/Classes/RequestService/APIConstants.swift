//
//  APIConstants.swift
//  WeatherApp
//
//  Created by Hrayr Yeghiazaryan on 02/03/2019.
//  Copyright © 2019 Hrayr Yeghiazaryan. All rights reserved.
//

import UIKit

struct APIConstants {

    // Request url and cache information
    static let baseUrl = "https://fcc-weather-api.glitch.me/api/current?"
    static let cacheControlValue = "no-cache"
    // Default is Yerevan
    static var cityCoordinates = "lat=40.177200&lon=44.503490"
}
