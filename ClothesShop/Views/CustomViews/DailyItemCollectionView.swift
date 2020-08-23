//
//  DailyItemCollectionVIew.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/22.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

public class DailyItemCollectionView: UIView {
    lazy var titleLabel = UILabel()
    lazy var collectionView: UICollectionView = {
        let rect = CGRect(x: 0, y: 0, width: 0, height: 0)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: rect, collectionViewLayout: layout)
        return collectionView
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func setupLabel() {
        addSubview(titleLabel)
        titleLabel.settingOptionLabel("Daily Item")
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(0).offset(10)
            make.centerX.equalTo(snp.centerX)
            make.height.equalTo(12)
        }
    }
    
    public func setupCollectionView() {
        setupLabel()
        addSubview(collectionView)
       
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(0)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
    }
}


