//
//  BasicImageCollectionView.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/16.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

public class BasicImageCollectionView: UIView {
    var thumbnailList: [String]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var colors:[UIColor] = [.red,.systemBlue,.systemGray,.systemFill,.green,.systemPurple,.systemPink]
    
    lazy var tabView = TabView()
    lazy var collectionView: UICollectionView = {
        let rect = CGRect(x: 0, y: 0, width: 0, height: 0)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: rect, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        collectionView.layer.borderWidth = 1
        collectionView.layer.borderColor = UIColor.red.cgColor
        return collectionView
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupTitleTabView()
        setupCollectionView()
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func setupTitleTabView() {
        addSubview(tabView)
        tabView.delegate = self
        tabView.layer.borderWidth = 1
        tabView.layer.borderColor = UIColor.black.cgColor
        tabView.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.height.equalTo(100)
            make.leading.equalTo(1)
            make.trailing.equalTo(-1)
        }
    }
    
    public func setupCollectionView() {
        addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BasicImageCollectionCell.self, forCellWithReuseIdentifier: "BasicImageCollectionCell")
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(tabView.snp.bottom).offset(10)
            make.height.equalTo(screenWidth*0.85)
            make.width.equalTo(screenWidth)
        }
    }
}

extension BasicImageCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:BasicImageCollectionCell = collectionView.dequeueCell(indexPath: indexPath)
        cell.imageView.backgroundColor = colors[indexPath.row]
        return cell
    }
}

extension BasicImageCollectionView: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = screenWidth
        let height = screenWidth * 0.85
        return CGSize(width: width, height: height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension BasicImageCollectionView: TabViewDelegate {
    func tabViewDidSelected(_ collectionView: UICollectionView, _ didseletedIndexPath: IndexPath) {
        
    }
}
