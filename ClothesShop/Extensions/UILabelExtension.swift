//
//  UILabelExtension.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/22.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func settingOptionLabel(_ title: String? = nil) {
        text = title
        textColor = .black
        textAlignment = .center
        preferredMaxLayoutWidth = 150
        backgroundColor = .white
        font = .boldSystemFont(ofSize: 12)
    }
}
