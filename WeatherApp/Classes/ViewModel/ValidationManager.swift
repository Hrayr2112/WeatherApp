//
//  ValidationManager.swift
//  WeatherApp
//
//  Created by Hrayr Yeghiazaryan on 02/03/2019.
//  Copyright © 2019 Hrayr Yeghiazaryan. All rights reserved.
//

import UIKit

struct ValidationManager {

    static func isValidEmail(address: String?) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: address)
    }
    
    static func isValidPassword(pass: String?) -> (valid: Bool, type: ErrorType) {
        if let password = pass {
            guard password.count > 5 else { return (false, .incorrectCount) }
            let numbersRange = password.rangeOfCharacter(from: .decimalDigits)
            guard numbersRange != nil else { return (false, .decimalDigits) }
            let upperCase = password.rangeOfCharacter(from: .uppercaseLetters)
            guard upperCase != nil else { return (false, .uppercase) }
            let underCase = password.rangeOfCharacter(from: .lowercaseLetters)
            guard underCase != nil else { return (false, .lowercase) }
            return (true, .none)
        } else {
            return (false, .incorrectCount)
        }
    }

}
