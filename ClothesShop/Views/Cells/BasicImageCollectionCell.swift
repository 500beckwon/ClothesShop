//
//  BasicImageCollectionCell.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/16.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
public class BasicImageCollectionCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemPurple
        return imageView
    }()
    
    lazy var collectionView: UICollectionView = {
           let rect = CGRect(x: 0, y: 0, width: 0, height: 0)
           let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .horizontal
           let collectionView = UICollectionView(frame: rect, collectionViewLayout: layout)
           collectionView.showsHorizontalScrollIndicator = false
           collectionView.backgroundColor = .white
           return collectionView
       }()
    
    var colors:[UIColor] = [.systemBlue,.systemGray,.systemFill,.green,.brown,.systemPink]

    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func setupImageView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(5)
            make.bottom.trailing.leading.equalTo(0)
        }
    }
    
    public func setupCollectionView() {
        addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImageViewCollectionCell.self, forCellWithReuseIdentifier: "ImageViewCollectionCell")
        collectionView.snp.makeConstraints { make in
            make.leading.top.equalTo(10)
            make.trailing.bottom.equalTo(-10)
        }
    }
}

extension BasicImageCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ImageViewCollectionCell = collectionView.dequeueCell(indexPath: indexPath)
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
}

extension BasicImageCollectionCell: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (screenWidth-40)/3, height: (screenWidth-20)/2.5)
    }
}
