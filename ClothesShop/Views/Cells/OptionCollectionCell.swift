//
//  MainCollectionCell.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/15.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

public class OptionCollectionCell: UICollectionViewCell {
    lazy var titleLabel = UILabel()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
         setupLabel()
    }
    
     public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func setupLabel() {
        addSubview(titleLabel)
        titleLabel.settingOptionLabel()
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(snp.centerX)
            make.centerY.equalTo(snp.centerY)
            make.height.equalTo(15)
        }
    }
}
