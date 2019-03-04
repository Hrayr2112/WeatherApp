//
//  APIService.swift
//  WeatherApp
//
//  Created by Hrayr Yeghiazaryan on 02/03/2019.
//  Copyright © 2019 Hrayr Yeghiazaryan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class APIService: NSObject {

    func getWeatherData(completionHandler: @escaping (_ result: APIWeatherResponse?) -> ()) {
        let url = APIConstants.baseUrl + APIConstants.cityCoordinates
        Alamofire.request(url).validate().responseObject { (response: DataResponse<APIWeatherResponse>) in
            guard let weatherDictionary = response.result.value else { return }
            switch response.result {
            case .success:
                completionHandler(weatherDictionary)
            case .failure:
                completionHandler(nil)
            }
        }
    }
    
}
