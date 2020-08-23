//
//  DailyItemSectionController.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/22.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import IGListKit

 class DailyItemSectionController: ListBindingSectionController<DailyItem>, ListBindingSectionControllerDataSource  {
        
    override public init() {
        super.init()
        dataSource = self
    }
    
//    override func numberOfItems() -> Int {
//        return 1
//    }
    
     func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
          print("fdblkdf;j1")
        guard let _object = object as? DailyItem else { fatalError() }
        let result = [DailyItem(itemImageURL: _object.itemImageURL,
                                uploadDate: _object.uploadDate,
                                itemName: _object.itemName,
                                itemPrice: _object.itemPrice,
                                stockCount: _object.stockCount,
                                itemTag: _object.itemTag)]
        return result
    }
    
     func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
          print("fdblkdf;j2")
        var identifier = ""
        let cellClass: AnyClass
        switch viewModel {
        case is DailyItem: identifier = "DailyItemCell"; cellClass = DailyItemCell.self
        default:
            print("fdblkdf;j3")
            fatalError()
        }
        
        guard let cell = collectionContext?.dequeueReusableCell(of: cellClass,
                                                                withReuseIdentifier: identifier,
                                                                for: self,
                                                                at: index) as? UICollectionViewCell & ListBindable else  {
                                                                      print("fdblkdf;j3")
                                                                    fatalError() }
          print("fdblkdf;j4",cell)
        return cell
    }
    
     func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
        return CGSize(width: screenWidth, height: screenWidth)
    }
    
}
