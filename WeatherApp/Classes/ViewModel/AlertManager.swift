//
//  AlertManager.swift
//  WeatherApp
//
//  Created by Hrayr Yeghiazaryan on 02/03/2019.
//  Copyright © 2019 Hrayr Yeghiazaryan. All rights reserved.
//

import UIKit

enum ErrorType {
    case none
    case incorrectEmail
    case incorrectCount
    case uppercase
    case lowercase
    case decimalDigits
    case connectionFailed
}

struct AlertManager {
    
    static func getAlertWithDefaultButton(message: String, errorType: ErrorType) -> UIAlertController {
        var text = ""
        switch errorType {
        case .none:
            text = UIConstants.none
            break
        case .incorrectEmail:
            text = UIConstants.incorrectEmail
            break
        case .incorrectCount:
            text = UIConstants.incorrectCount
            break
        case .uppercase:
            text = UIConstants.uppercase
            break
        case .lowercase:
            text = UIConstants.lowercase
            break
        case .decimalDigits:
            text = UIConstants.decimalDigits
            break
        case .connectionFailed:
            text = UIConstants.connectionFailed
            break
        }
        let alert = UIAlertController(title: text, message: message, preferredStyle: .alert)
        let approveButton = UIAlertAction(title: UIConstants.approveTitle, style: .default, handler: nil)
        alert.addAction(approveButton)
        return alert
    }
    
}
