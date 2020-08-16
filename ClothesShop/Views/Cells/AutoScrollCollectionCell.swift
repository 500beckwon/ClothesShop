//
//  AutoScrollCollectionCell.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/15.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

public class AutoScrollCollectionCell: UICollectionViewCell {
    
    var banerImageView = UIImageView()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func setupImageView() {
        addSubview(banerImageView)
        banerImageView.backgroundColor = .systemIndigo
        banerImageView.contentMode = .scaleAspectFill
        banerImageView.clipsToBounds = true
        banerImageView.layer.cornerRadius = 8
        banerImageView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(0)
        }
    }
}
