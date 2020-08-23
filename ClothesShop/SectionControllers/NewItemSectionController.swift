//
//  NewItemSectionController.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/23.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import IGListKit

class NewItemSectionController: ListBindingSectionController<NewItem>, ListBindingSectionControllerDataSource  {
    
    override  init() {
        super.init()
        print("@$dsfsdfsd1")
        dataSource = self
    }
    
     func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
        print("@#$gbfgbd2")
        guard let _object = object as? NewItem else {
            print("파탈")
            fatalError() }
        let result = [NewItem(imageURL: _object.imageURL,
                              uploadDate: _object.uploadDate,
                              itemName: _object.itemName,
                              salePercent: _object.salePercent,
                              itemTag: _object.itemTag,
                              itemPrice: _object.itemPrice)]
        return result
    }
    
     func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        print("@#dsafaddsd3")
        var identifier = ""
        let cellClass: AnyClass
        switch viewModel {
        case is NewItem:
            print("뉴")
            identifier = "NewItemCell"; cellClass = NewItemCell.self
        default:
             print("@#dsafaddsd4")
            fatalError()
        }
        
        guard let cell = collectionContext?.dequeueReusableCell(of: cellClass,
                                                                withReuseIdentifier: identifier,
                                                                for: self,
                                                                at: index) as? UICollectionViewCell & ListBindable else  {
                                                                     print("@#dsafaddsd5")
                                                                    fatalError() }
        print("3393939",cell)
        return cell
    }
    
     func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
        return CGSize(width: screenWidth, height: screenWidth)
    }
    
}


extension BannerItemSectionController {
    
}
