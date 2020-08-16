//
//  ImageViewCollectionCell.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/16.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

public class ImageViewCollectionCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
    }
    
    required public init?(coder: NSCoder) {
        fatalError()
    }
    
   public func setupImageView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(5)
            make.bottom.trailing.leading.equalTo(0)
        }
    }
}
