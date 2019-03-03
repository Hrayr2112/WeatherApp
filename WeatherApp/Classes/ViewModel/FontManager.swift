//
//  FontManager.swift
//  WeatherApp
//
//  Created by Hrayr Yeghiazaryan on 02/03/2019.
//  Copyright © 2019 Hrayr Yeghiazaryan. All rights reserved.
//

import UIKit

struct FontManager {

    static func getTextWith(letterSpacing: CGFloat, lineHeight: CGFloat, text: String, fontName: String, textSize: CGFloat) -> NSMutableAttributedString? {
        guard let font = UIFont(name: fontName, size: textSize) else { return NSMutableAttributedString(string: text) }
        let attributedStr = NSMutableAttributedString.init(string: text, attributes: [NSAttributedString.Key.font: font])
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight
        attributedStr.addAttribute(NSAttributedString.Key.paragraphStyle,
                                   value:paragraphStyle,
                                   range:NSMakeRange(0, attributedStr.length))
        attributedStr.addAttribute(NSAttributedString.Key.kern,
                                   value: letterSpacing,
                                   range: NSMakeRange(0, attributedStr.length))
        return attributedStr
    }
    
}
