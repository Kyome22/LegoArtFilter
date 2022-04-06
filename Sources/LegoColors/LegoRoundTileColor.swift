//
//  LegoRoundTileColor.swift
//
//
//  Created by Takuto Nakamura on 2022/04/05.
//
//  Tile, Round 1×1 Items For Sale (Bricklink.com)
//  https://www.bricklink.com/browseList.asp?itemType=P&catString=117

import SwiftUI

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

public enum LegoRoundTileColor: RawRepresentable, CaseIterable {
    public typealias RawValue = LegoColor

    case white
    case lightBluishGray
    case lightGray
    case darkBluishGray
    case black
    case darkRed
    case red
    case coral
    case brown
    case reddishBrown
    case darkTan
    case tan
    case lightNougat
    case mediumNougat
    case darkOrange
    case orange
    case brightLightOrange
    case yellow
    case brightLightYellow
    case neonYellow
    case yellowishGreen
    case lime
    case oliveGreen
    case green
    case brightGreen
    case darkTurquoise
    case lightAqua
    case darkBlue
    case blue
    case darkAzure
    case mediumAzure
    case mediumBlue
    case brightLightBlue
    case sandBlue
    case lavender
    case magenta
    case darkPink
    case brightPink
    case pink

    public init?(rawValue: RawValue) {
        return nil
    }

    public var rawValue: RawValue {
        switch self {
        case .white:              return SolidColors[0_]
        case .lightBluishGray:    return SolidColors[3_]
        case .lightGray:          return SolidColors[4_]
        case .darkBluishGray:     return SolidColors[6_]
        case .black:              return SolidColors[7_]
        case .darkRed:            return SolidColors[8_]
        case .red:                return SolidColors[9_]
        case .coral:              return SolidColors[11]
        case .brown:              return SolidColors[16]
        case .reddishBrown:       return SolidColors[18]
        case .darkTan:            return SolidColors[20]
        case .tan:                return SolidColors[21]
        case .lightNougat:        return SolidColors[22]
        case .mediumNougat:       return SolidColors[24]
        case .darkOrange:         return SolidColors[28]
        case .orange:             return SolidColors[30]
        case .brightLightOrange:  return SolidColors[32]
        case .yellow:             return SolidColors[36]
        case .brightLightYellow:  return SolidColors[38]
        case .neonYellow:         return SolidColors[39]
        case .yellowishGreen:     return SolidColors[42]
        case .lime:               return SolidColors[44]
        case .oliveGreen:         return SolidColors[45]
        case .green:              return SolidColors[47]
        case .brightGreen:        return SolidColors[48]
        case .darkTurquoise:      return SolidColors[52]
        case .lightAqua:          return SolidColors[55]
        case .darkBlue:           return SolidColors[56]
        case .blue:               return SolidColors[57]
        case .darkAzure:          return SolidColors[58]
        case .mediumAzure:        return SolidColors[60]
        case .mediumBlue:         return SolidColors[62]
        case .brightLightBlue:    return SolidColors[63]
        case .sandBlue:           return SolidColors[65]
        case .lavender:           return SolidColors[75]
        case .magenta:            return SolidColors[78]
        case .darkPink:           return SolidColors[79]
        case .brightPink:         return SolidColors[81]
        case .pink:               return SolidColors[82]
        }
    }
}

public extension LegoRoundTileColor {
    init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self = LegoRoundTileColor.getApproximateColor(r: r, g: g, b: b)
    }

    init?(cgColor: CGColor) {
        guard let rgba = cgColor.rgba else { return nil }
        self = LegoRoundTileColor.getApproximateColor(r: rgba.r, g: rgba.g, b: rgba.b)
    }

#if canImport(UIKit)
    init?(uiColor: UIColor) {
        self.init(cgColor: uiColor.cgColor)
    }
#elseif canImport(AppKit)
    init?(nsColor: NSColor) {
        self.init(cgColor: nsColor.cgColor)
    }
#endif

    static func getApproximateColor(r: CGFloat, g: CGFloat, b: CGFloat) -> LegoRoundTileColor {
        let colors = LegoRoundTileColor.allCases
        var n: Int = 0
        var diff = colors[n].rawValue.diff(red: r, green: g, blue: b)
        for i in (1 ..< colors.count) {
            let d = colors[i].rawValue.diff(red: r, green: g, blue: b)
            if d < diff {
                diff = d
                n = i
            }
        }
        return colors[n]
    }
}
