//
//  NewItemCell.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/23.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import IGListKit
import SnapKit
public class NewItemCell: UICollectionViewCell, ListBindable {
    lazy var priceLabel = UILabel()
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override public init(frame: CGRect) {
        super.init(frame:frame)
        setupLabel()
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func setpImageView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(0)
            make.top.equalTo(0).offset(10)
            make.bottom.equalTo(0).offset(30)
        }
    }
    
    public func setupLabel() {
        setpImageView()
        addSubview(priceLabel)
        priceLabel.settingOptionLabel()
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.height.equalTo(15)
        }
    }
    
    public func bindViewModel(_ viewModel: Any) {
        print(viewModel,"333")
        if let _viewModel = viewModel as? NewItem {
            priceLabel.text = "\(_viewModel.itemPrice)원"
        }
    }
    
}
