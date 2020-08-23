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
import IGListKit

public class AutoScrollCollectionCell: UICollectionViewCell, ListBindable {
    
    var banerImageView = UIImageView()
    var titleLabel = UILabel()
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupTitleLabel()
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
    
    public func setupTitleLabel() {
        setupImageView()
        addSubview(titleLabel)
        titleLabel.settingOptionLabel()
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(snp.centerY)
            make.centerX.equalTo(snp.centerX)
        }
    }
    
    public func bindViewModel(_ viewModel: Any) {
        if let _viewModel = viewModel as? BannerItem {
            titleLabel.text = _viewModel.itemName
        }
    }
}
