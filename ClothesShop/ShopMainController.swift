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
    var collectionView: UICollectionView = {
        let rect = CGRect(x: 0, y: 0, width: 0, height: 0)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: rect, collectionViewLayout: layout)
        return collectionView
    }()
    
    var tableView: UITableView = {
        let rect = CGRect(x: 0, y: 0, width: 0, height: 0)
        let tableView = UITableView(frame:rect, style: .grouped)
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
    
    public func setupAutoScrollView() {
        topOptionScrollView()
        view.addSubview(autoScrollView)
        autoScrollView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(1)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(screenWidth)
        }
    }
    
    public func mainTableView() {
       // setupAutoScrollView()
         topOptionScrollView()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
        tableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(0)
            make.topMargin.equalTo(collectionView.snp.bottom)
        }
    }
}

extension ShopMainController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: OptionCollectionCell = collectionView.dequeueCell(indexPath: indexPath)
        cell.backgroundColor = .red
        return cell
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
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        if scrollView.contentOffset.y > 50 {
            tableView.sectionHeaderHeight = 0
            tableView.headerView(forSection: 0)?.isHidden = true
        }
    }
    
    
//    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset.y,"jdafl;s;af")
//        if scrollView.contentOffset.y >= 1 {
//            UIView.animate(withDuration: 0.3) {
//                self.autoScrollView.snp.updateConstraints { make in
//                    make.height.equalTo(0)
//                }
//                self.view.layoutIfNeeded()
//            }
//        } else {
//            UIView.animate(withDuration: 0.3) {
//                self.autoScrollView.snp.updateConstraints { make in
//                    make.height.equalTo(screenWidth)
//                }
//                self.view.layoutIfNeeded()
//            }
//        }
//    }
}
