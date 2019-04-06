//
//  Fonts.swift
//  DextraiOSAssignment
//
//  Created by Jyotsna Singh on 04/04/19.
//  Copyright © 2019 alice singh. All rights reserved.
//
import UIKit
import Foundation

enum Fonts: String {
    case helvetica = "Helvetica"
    case helveticaBold = "Helvetica-Bold"
}

extension Fonts {
    func of(_ size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
    }
}
