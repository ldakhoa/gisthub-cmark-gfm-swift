//
//  File.swift
//  
//
//  Created by Khoa Le on 22/12/2022.
//

import UIKit
import StyledTextKit

enum Text {
    static let code = TextStyle(font: .name("Courier"), size: 16)
    static let body = TextStyle(size: 15)

    static let h1 = TextStyle(font: .system(.bold), size: 24)
    static let h2 = TextStyle(font: .system(.bold), size: 20)
    static let h3 = TextStyle(font: .system(.bold), size: 20)
    static let h4 = TextStyle(font: .system(.bold), size: 18)
    static let h5 = TextStyle(font: .system(.bold), size: 16)
    static let h6 = TextStyle(font: .system(.bold), size: 16)
}

extension TextStyle {

    var preferredFont: UIFont {
        return self.font(contentSizeCategory: UIContentSizeCategory.preferred)
    }

    func with(attributes: [NSAttributedString.Key: Any]) -> TextStyle {
        var newAttributes = self.attributes
        for (key, value) in attributes {
            newAttributes[key] = value as? AnyHashable
        }
        return TextStyle(font: font, size: size, attributes: newAttributes, minSize: minSize, maxSize: maxSize)
    }

    func with(foreground: UIColor? = nil, background: UIColor? = nil) -> TextStyle {
        var attributes = self.attributes
        attributes[.foregroundColor] = foreground ?? attributes[.foregroundColor] as! UIColor
        attributes[.backgroundColor] = background ?? attributes[.backgroundColor] as! UIColor
        return TextStyle(font: font, size: size, attributes: attributes, minSize: minSize, maxSize: maxSize)
    }
}
