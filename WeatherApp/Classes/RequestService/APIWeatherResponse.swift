//
//  APIWeatherResponse.swift
//  WeatherApp
//
//  Created by Hrayr Yeghiazaryan on 02/03/2019.
//  Copyright © 2019 Hrayr Yeghiazaryan. All rights reserved.
//

import UIKit
import ObjectMapper

class APIWeatherResponse: Mappable {
    var temperature: Float?
    
    required init?(map: Map){
        guard map.JSON["main"] != nil else { return nil }
    }
    
    func mapping(map: Map) {
        temperature <- map["main.temp"]
    }
}
