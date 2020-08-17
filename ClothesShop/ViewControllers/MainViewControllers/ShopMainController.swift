//
//  ShopMainController.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/15.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
public class ShopMainController: UIViewController {
    
    var autoScrollView = AutoScrollCollectionView()
    var bestItemView = BasicImageCollectionView()
    
    var collectionView: UICollectionView = {
        let rect = CGRect(x: 0, y: 0, width: 0, height: 0)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: rect, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    var tableView: UITableView = {
        let rect = CGRect(x: 0, y: 0, width: 0, height: 0)
        let tableView = UITableView(frame:rect, style: .grouped)
        tableView.backgroundColor = .white
        return tableView
    }()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        mainTableView()
    }
    
    public func topOptionScrollView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(OptionCollectionCell.self, forCellWithReuseIdentifier: "OptionCollectionCell")
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(40)
        }
    }
    
    public func mainTableView() {
        topOptionScrollView()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
        tableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(0)
            make.top.equalTo(collectionView.snp.bottom).offset(10)
        }
    }
}

extension ShopMainController: UICollectionViewDataSource, UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: OptionCollectionCell = collectionView.dequeueCell(indexPath: indexPath)
        cell.titleLabel.text = "\(indexPath.row + 1)"
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row+1)
    }
}

extension ShopMainController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 40)
    }
}

extension ShopMainController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return autoScrollView
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return screenWidth
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MainTableViewCell = tableView.dequeueCell(indexPath: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1)"
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.systemBlue.cgColor
        if indexPath.row == 1 {
            cell.contentView.addSubview(bestItemView)
            bestItemView.snp.makeConstraints { make in
                make.top.leading.trailing.equalTo(0)
                make.bottom.equalTo(-10)
            }
        }
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return (screenWidth * 0.85) + 110
        } else {
            return 100
        }
    }
}
