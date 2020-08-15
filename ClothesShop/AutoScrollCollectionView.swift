//
//  AutoScrollCollectionView.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/15.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
let screenWidth = UIScreen.main.bounds.width
public class AutoScrollCollectionView: UIView, UIScrollViewDelegate {
    
    //터치시 셀의 담긴 정보에 따라 나타나는 게 다름
    //이미지만 보내는게 아닌 링크(문자열url)를 담을것
    //자동 스크롤 만들기
    //스와이프가 발생해도 자동스크롤 진행
     var count = 0
    let colors: [UIColor] = [.white,.red,.blue,.brown,.darkGray,.green]
    var pageCountLabel = UILabel()
    var imageObject: [UIView]?
    var numPages: Int = 0
    var pageControl: UIPageControl?
    var banerCollectionView: UICollectionView = {
        let rect = CGRect(x: 0, y: 0, width: 0, height: 0)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: rect, collectionViewLayout: layout)
        return collectionView
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupPageControl()
        autoScroll(colors.count,
                   pageCountLabel,
                   banerCollectionView)
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupCollectionView() {
        addSubview(banerCollectionView)
        banerCollectionView.delegate = self
        banerCollectionView.dataSource = self
        banerCollectionView.isPagingEnabled = true
        banerCollectionView.showsHorizontalScrollIndicator = false
        banerCollectionView.isUserInteractionEnabled = false
        banerCollectionView.register(AutoScrollCollectionCell.self, forCellWithReuseIdentifier: "AutoScrollCollectionCell")
        banerCollectionView.snp.makeConstraints { make in
            make.bottom.top.leading.trailing.equalTo(0)
        }
    }
    
    func setupPageControl() {
        setupCollectionView()
        addSubview(pageCountLabel)
        pageCountLabel.textColor = .white
        pageCountLabel.backgroundColor = .black
        pageCountLabel.textAlignment = .center
        pageCountLabel.layer.cornerRadius = 5
        pageCountLabel.clipsToBounds = true
        pageCountLabel.font = .boldSystemFont(ofSize: 10)
        pageCountLabel.text = "1/\(colors.count)"
        pageCountLabel.snp.makeConstraints { make in
            make.trailing.equalTo(-5)
            make.bottom.equalTo(-10)
            make.width.equalTo(50)
        }
    }
    
    func autoScroll(_ objectCount: Int, _ countLabel: UILabel, _ scrollView: UICollectionView) {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.count += 1
            let pointX = CGFloat(self.count) * screenWidth
            UIView.animate(withDuration: 1) {
                if self.count == objectCount {
                    UIView.animate(withDuration: 1, delay: 1, options: .curveLinear, animations: {
                        self.count = 0
                        countLabel.text = "1/\(objectCount)"
                        scrollView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .right, animated: true)
                    })
                } else {
                let rect = CGRect(x: pointX, y: 0, width: screenWidth, height: screenWidth)
                scrollView.scrollRectToVisible(rect, animated: true)
                countLabel.text = "\(self.count+1)/\(objectCount)"
                }
            }
            self.layoutIfNeeded()
        }
    }
}

extension AutoScrollCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:AutoScrollCollectionCell = collectionView.dequeueCell(indexPath: indexPath)
        cell.banerImageView.backgroundColor = colors[indexPath.row]
        return cell
    }
}

extension AutoScrollCollectionView: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenWidth, height: screenWidth)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
