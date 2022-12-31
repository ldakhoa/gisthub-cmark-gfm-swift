//
//  File.swift
//  
//
//  Created by Khoa Le on 22/12/2022.
//

import UIKit

enum HTMLColors {
    static let test = "0969da"
}

enum Colors {
    case accentForeground
    case canvasSubtitle
    case foregroundDefault
    case background
    case muted // quote, h6
    case borderDefault
    case neutralMuted // codeblock background

    var light: UIColor {
        switch self {
        case .accentForeground:
            return UIColor(colorValue: ColorValue(0x0969da))
        case .canvasSubtitle:
            return UIColor(colorValue: ColorValue(0xf6f8fa))
        case .foregroundDefault:
            return UIColor(colorValue: ColorValue(0x24292f))
        case .background:
            return .white
        case .muted:
            return UIColor(colorValue: ColorValue(0x57606a))
        case .borderDefault:
            return UIColor(colorValue: ColorValue(0xd0d7de))
        case .neutralMuted:
            return UIColor(red: 175/255, green: 184/255, blue: 193/255, alpha: 0.2)
        }
    }

    var dark: UIColor {
        switch self {
        case .accentForeground:
            return UIColor(colorValue: ColorValue(0x0969da))
        case .canvasSubtitle:
            return UIColor(colorValue: ColorValue(0x161b22))
        case .foregroundDefault:
            return UIColor(colorValue: ColorValue(0xc9d1d9))
        case .background:
            return .black
        case .muted:
            return UIColor(colorValue: ColorValue(0x8b949e))
        case .borderDefault:
            return UIColor(colorValue: ColorValue(0xd0d7de))
        case .neutralMuted:
            return UIColor(red: 175/255, green: 184/255, blue: 193/255, alpha: 0.2)
        }
    }

    var string: String {
        switch self {
        case .accentForeground:
            return "0969da"
        case .canvasSubtitle:
            return "f6f8fa"
        case .foregroundDefault:
            return "24292f"
        case .background:
            return "ffffff"
        case .muted:
            return "57606a"
        case .borderDefault:
            return "d0d7de"
        case .neutralMuted:
            return "afb8c133"
        }
    }

    var color: UIColor {
        UIColor(light: light, dark: dark)
    }
}
