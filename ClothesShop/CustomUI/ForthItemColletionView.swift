//
//  ForthItemViewController.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2019/12/18.
//  Copyright © 2019 ByungHoon Ann. All rights reserved.
//

import UIKit

 protocol ForthItemColletionViewDelegate: class {
}
 

class ForthItemColletionView: UIView {
    
    weak var delegate: ForthItemColletionViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupForthCell()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var collectionView: UICollectionView = {
        let collectioviewLayout = UICollectionViewFlowLayout()
        let collectionview = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: collectioviewLayout)
        collectioviewLayout.scrollDirection = .vertical
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.backgroundColor = .white
        return collectionview
    }()

    func setupCollectionView() {
        let nibName = UINib(nibName: "ForthItemColletionView", bundle: nil)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(nibName, forCellWithReuseIdentifier: "forthcell")
       
    }
    
    func setupForthCell() {
        setupCollectionView()
        
        self.addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
}

extension ForthItemColletionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "forthcell", for: indexPath) as! ForthItemColletionViewCell
        let text = ["1","2","3","4","5","6"]
        cell.label.text = text[indexPath.row]
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        return cell
    }
    
}

extension ForthItemColletionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width/3 - 5, height: collectionView.frame.width/3 + 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

class ForthItemColletionViewCell: UICollectionViewCell {
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(label)
        label.centerXAnchor.constraint(equalTo:  self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}

