//
//  IGMainController.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/23.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import IGListKit
import SnapKit

class IGMainController: UIViewController {
    var backButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    var rightInfomationLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    let collectionView: UICollectionView = {
        let rect = CGRect(x: 0, y: 0, width: 0, height: 0)
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: rect, collectionViewLayout: layout)
        return view
    }()
    
    lazy var adapter: ListAdapter = {
        return ListAdapter (updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
        _ = adapter
    }
    
    func setupTopButtons() {
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 18).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 34).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 34).isActive = true
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
        view.addSubview(rightInfomationLabel)
        rightInfomationLabel.translatesAutoresizingMaskIntoConstraints = false
        rightInfomationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 23).isActive = true
        rightInfomationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        rightInfomationLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        rightInfomationLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
      //  rightInfomationButton.titleLabel?.textAlignment = .right
    }
    
    func setupCollectionView() {
       // setupTopButtons()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(0)
        }
       
        
        adapter.dataSource = self
        adapter.collectionView = collectionView
        adapter.performUpdates(animated: true, completion: nil)
    }
}

extension IGMainController: ListAdapterDataSource {
    
    
    public func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
          return AllModel.objects
      }
      
      public func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
          switch object {
          case is BannerItem: return BannerItemSectionController()
          case is DailyItem: return DailyItemSectionController()
          case is BestItem: return BestItemSectionController()
          case is NewItem: return NewItemSectionController()
          default:
            print("22222@")
            return ListSectionController()
          }
      }
      
      public func emptyView(for listAdapter: ListAdapter) -> UIView? {
          return nil
      }
}


