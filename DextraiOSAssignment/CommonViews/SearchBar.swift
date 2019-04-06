//
//  SearchBar.swift
//  DextraiOSAssignment
//
//  Created by Jyotsna Singh on 06/04/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import Foundation
import UIKit

extension UISearchBar {
    convenience init(placeholder: String) {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40)
        self.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.barStyle = .default
        self.placeholder = placeholder
        self.layer.borderWidth = 0
        self.searchBarStyle = .minimal
        self.setImage(UIImage(), for: .search, state: .normal)
        self.searchTextPositionAdjustment = UIOffset(horizontal: 8, vertical: 0)
    }
}
