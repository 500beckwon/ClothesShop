//
//  TabCell.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/16.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

public class TabCell:UICollectionViewCell {
    
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.clipsToBounds = true
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.cornerRadius = 7.5
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1
        return label
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupTitleLabel()
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(snp.centerX)
            make.centerY.equalTo(snp.centerY)
            make.height.equalTo(20)
            make.width.equalTo(40)
        }
    }
}
