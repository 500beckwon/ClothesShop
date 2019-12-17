//
//  CustomTabBarItem.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2019/12/12.
//  Copyright © 2019 ByungHoon Ann. All rights reserved.
//

//MARK:- CustomTabMenuBar

import UIKit

protocol CustomTabBarItemDelegate: class {
    func customMenubar(scrollTo Index: Int)
}

class CustomTabBarItem: UIView {
    
    weak var delegate: CustomTabBarItemDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupCustomTabBar()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var collectionView: UICollectionView = {
        let collectioviewLayout = UICollectionViewFlowLayout()
        let collectionview = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: collectioviewLayout)
        collectioviewLayout.scrollDirection = .horizontal
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.backgroundColor = .white
        return collectionview
    }()
    
    var indicator: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var indicatorViewLeadingConstraint: NSLayoutConstraint!
    var indicatorViewWidthConstraint: NSLayoutConstraint!

    func setupCollectionView() {
        let nibName = UINib(nibName: "CollectionViewCell", bundle: nil)
        let indexPath = IndexPath(item: 0, section: 0)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(nibName, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = false
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
    }
    
    func setupCustomTabBar() {
        setupCollectionView()
        
        self.addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        self.addSubview(indicator)
        
        indicatorViewLeadingConstraint = indicator.leadingAnchor.constraint(equalTo:  self.leadingAnchor)
        indicatorViewLeadingConstraint.isActive = true
        indicatorViewWidthConstraint = indicator.widthAnchor.constraint(equalToConstant: self.frame.width/4)
        indicatorViewWidthConstraint.isActive = true
        indicator.heightAnchor.constraint(equalToConstant: 5).isActive = true
        indicator.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
}

extension CustomTabBarItem: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let text = ["베이직","아우터","세일","셋트"]
        cell.label.text = text[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.customMenubar(scrollTo: indexPath.row)
    }
    
}

extension CustomTabBarItem: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width/4, height: 55)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell else { return }
        cell.label.textColor = .lightGray
    }
    
}

class CollectionViewCell: UICollectionViewCell {
    var label: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            self.label.textColor = isSelected ? .black : .purple
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(label)
        label.centerXAnchor.constraint(equalTo:  self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
















