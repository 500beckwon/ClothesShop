//
//  TabView.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/16.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import UIKit
import SnapKit
protocol TabViewDelegate {
    func tabViewDidSelected(_ collectionView: UICollectionView, _ didseletedIndexPath: IndexPath)
}
public class TabView: UIView {
    var delegate:TabViewDelegate?
    var tabTitleList = [String]()
    lazy var headerTitleLabel = UILabel()
    lazy var collectionView: UICollectionView = {
        let rect = CGRect(x: 0, y: 0, width: 0, height: 0)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: rect, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func setupTitleHeaderLabel() {
        addSubview(headerTitleLabel)
        headerTitleLabel.text = "제목"
        headerTitleLabel.backgroundColor = .white
        headerTitleLabel.textAlignment = .center
        headerTitleLabel.textColor = .black
        headerTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(15)
            make.centerX.equalTo(snp.centerX)
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
    }
    
    public func setupCollectionView() {
        setupTitleHeaderLabel()
        addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TabCell.self, forCellWithReuseIdentifier: "TabCell")
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(headerTitleLabel.snp.bottom).offset(10)
            make.leading.equalTo(1)
            make.trailing.equalTo(-1)
            make.bottom.equalTo(snp.bottom).offset(-5)
        }
    }
}

extension TabView: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:TabCell = collectionView.dequeueCell(indexPath: indexPath)
        cell.titleLabel.text = "\(indexPath.row+1)"
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.tabViewDidSelected(collectionView, indexPath)
    }
}

extension TabView: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (screenWidth-7)/7
        return CGSize(width: width, height: 40)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

extension TabView: UIScrollViewDelegate {
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating")
    }
}
