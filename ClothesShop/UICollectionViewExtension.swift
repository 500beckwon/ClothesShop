//
//  UICollectionViewExtension.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/15.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    func registerCell<T:UICollectionViewCell>(_: T.Type) {
        if let nib = T.nib {
            register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
        } else {
            register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    func dequeueCell<T:UICollectionViewCell>(indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
    func initCellforItem<T:UICollectionViewCell>(indexPath: IndexPath) -> T {
        return cellForItem(at: indexPath) as! T
    }
}

extension UICollectionViewCell: Reusable { }
