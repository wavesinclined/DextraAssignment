//
//  ReuseIdGenerator.swift
//  DextraiOSAssignment
//
//  Created by Jyotsna Singh on 04/04/19.
//  Copyright © 2019 alice singh. All rights reserved.
//
import Foundation
import UIKit

protocol ReuseableView: class {
    static var reuseId: String { get }
}

extension ReuseableView where Self: UIView  {
    static var reuseId: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReuseableView { }
extension UICollectionViewCell: ReuseableView { }

extension UITableView {
    func dequeueReusableCell<T: ReuseableView>(_ indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: T.reuseId, for: indexPath) as! T
    }
    
    func register<T: UITableViewCell>(_ cellType: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.reuseId)
    }
}

extension UICollectionView {
    func dequeueReusableCell<T: ReuseableView>(_ indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: T.reuseId, for: indexPath) as! T
    }
    func register<T: UICollectionViewCell>(_ cellType: T.Type) {
        self.register(T.self, forCellWithReuseIdentifier: T.reuseId)
    }
}
