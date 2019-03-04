//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Hrayr Yeghiazaryan on 02/03/2019.
//  Copyright © 2019 Hrayr Yeghiazaryan. All rights reserved.
//

import Foundation
import Alamofire

public class NetworkManager: NSObject {

    static let shared = NetworkManager()

    let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "google.com")!

    internal func isNetworkReachable() -> Bool {
        return reachabilityManager.isReachable
    }
}
