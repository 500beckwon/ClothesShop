//
//  BannerItemSectionController.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/23.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import IGListKit

class BannerItemSectionController: ListBindingSectionController<BannerItem>, ListBindingSectionControllerDataSource  {
    
    var bannerItem: BannerItem?
    
    override  init() {
        super.init()
        dataSource = self
    }
    
     func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
        guard let _object = object as? BannerItem else { fatalError() }
        let result = [BannerItem(itemImageURL: _object.itemImageURL,
                                 uploadDate: _object.uploadDate,
                                 itemName: _object.itemName,
                                 itemTag: _object.itemTag)]
        return result
    }
    
     func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        print("32423432")
        var identifier = ""
        let cellClass: AnyClass
        switch viewModel {
        case is BannerItem: identifier = "AutoScrollCollectionCell"; cellClass = AutoScrollCollectionCell.self
        default: fatalError()
        }
        
        
        guard let cell = collectionContext?.dequeueReusableCell(of: cellClass,
                                                                withReuseIdentifier: identifier,
                                                                for: self,
                                                                at: index) as? UICollectionViewCell & ListBindable else  { fatalError() }
        return cell
    }
    
     func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
        return CGSize(width: screenWidth, height: screenWidth)
    }
    
}


extension BannerItemSectionController {
//    private func getBannerCell(at index: Int) -> UICollectionViewCell? {
//        guard let ctx = collectionContext else {
//            return UICollectionViewCell()
//        }
//        let cell = ctx.dequeueReusableCell(of: AutoScrollCollectionCell.self, for: self, at: index)
//        return cell
//    }
}
