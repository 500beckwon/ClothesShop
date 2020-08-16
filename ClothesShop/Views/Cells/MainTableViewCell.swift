//
//  MainTableViewCell.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/15.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

public class MainTableViewCell: UITableViewCell {

    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
     public required init?(coder: NSCoder) {
        fatalError()
    }
}
