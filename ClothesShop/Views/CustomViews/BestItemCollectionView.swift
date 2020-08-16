//
//  BestItemCollectionView.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/16.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
internal class BestItemCollectionView: UIView {
    var titleLabel = UILabel()
    
    lazy var collectionView: UICollectionView = {
        let rect = CGRect(x: 0, y: 0, width: 0, height: 0)
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: rect, collectionViewLayout: layout)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupCollectionView() {
        collectionView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalTo(0)
        }
    }
}
