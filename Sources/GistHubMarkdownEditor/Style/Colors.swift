//
//  File.swift
//  
//
//  Created by Khoa Le on 22/12/2022.
//

import UIKit

enum Colors {
    case canvasSubtitle
    case foregroundDefault
    case background
    case muted // quote

    var light: UIColor {
        switch self {
        case .canvasSubtitle:
            return UIColor(colorValue: ColorValue(0xf6f8fa))
        case .foregroundDefault:
            return UIColor(colorValue: ColorValue(0x24292f))
        case .background:
            return .white
        case .muted:
            return UIColor(colorValue: ColorValue(0x57606a))
        }
    }

    var dark: UIColor {
        switch self {
        case .canvasSubtitle:
            return UIColor(colorValue: ColorValue(0x161b22))
        case .foregroundDefault:
            return UIColor(colorValue: ColorValue(0xc9d1d9))
        case .background:
            return .black
        case .muted:
            return UIColor(colorValue: ColorValue(0x8b949e))
        }
    }

    var color: UIColor {
        UIColor(light: light, dark: dark)
    }
}
