//
//  UITableViewExtension.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/15.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import UIKit

extension UITableView : Reusable {
    func registerCell<T:UITableViewCell>(_: T.Type) {
        if let nib = T.nib {
            self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    func dequeueCell<T:UITableViewCell>(indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
    func initCellforItem<T:UITableViewCell>(indexPath: IndexPath) -> T {
        return cellForRow(at: indexPath) as! T
    }
}

extension UITableViewCell: Reusable { }
