//
//  UIConstants.swift
//  WeatherApp
//
//  Created by Macbook Home on 03/03/2019.
//  Copyright © 2019 Hrayr Yeghiazaryan. All rights reserved.
//

import UIKit

struct UIConstants {

    // Navigation Bar
    static let loginNavigationTitle = "Авторизация"

    // Button's color
    static let forgotPasswordBorderColor = UIColor(red: 235 / 255,
                                                   green: 235 / 255,
                                                   blue: 235 / 255,
                                                   alpha: 1.0)
    // Letter spacing
    static let textFieldLetterSpacing: CGFloat = -0.32
    static let loginButtonLetterSpacing: CGFloat = -0.24
    static let createAccountLetterSpacing: CGFloat = -0.16
    static let fogortPasswordLetterSpacing: CGFloat = -0.13
    static let navigationTitleLetterSpacing: CGFloat = -0.41
    static let descriptionLabelLetterSpacing: CGFloat = 0.13

    // Line spacing
    static let newAccountButtonLineSpacing: CGFloat = 1.2
    static let descriptionLabelLineSpacing: CGFloat = 1.35
    static let forgotPasswordButtonLineSpacing: CGFloat = 1.5

    // Text Size
    static let buttonTextSize: CGFloat = 15.0
    static let textFieldTextSize: CGFloat = 16.0
    static let navigationTitleTextize: CGFloat = 17.0
    static let descriptionLabelTextSize: CGFloat = 13.0
    static let forgotPasswordButtonTextSize: CGFloat = 12.0

    // Fonts
    static let textMediumFont  = "SFUIText-Medium"
    static let textRegularFont = "SFUIText-Regular"

    // Password validation
    static let approveTitle = "Ok"
    static let none = "Погода в Москве"
    static let connectionFailed = "Нет соединения с интернетом"
    static let decimalDigits = "Пароль должен содержать хотя бы одну цифру"
    static let incorrectCount = "Пароль должен содержать как минимум 6 символов"
    static let lowercase = "Пароль должен содержать хотя бы одну строчную букву"
    static let uppercase = "Пароль должен содержать хотя бы одну заглавную букву"

    // Email validation
    static let incorrectEmail = "Введите корректный адрес почты"
}
