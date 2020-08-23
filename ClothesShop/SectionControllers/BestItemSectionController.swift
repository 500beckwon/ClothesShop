//
//  BestItemSectionController.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/17.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import IGListKit

class BestItemSectionController: ListBindingSectionController<BestItem>, ListBindingSectionControllerDataSource {
    
    override init() {
        super.init()
        dataSource = self
    }
    var currentBestItem: BestItem?
    

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
        guard let _object = object as? BestItem else { fatalError() }
        let reseult = [BestItem(itemImageURL: _object.itemImageURL,
                                uploadDate: _object.uploadDate,
                                itemName: _object.itemName,
                                itemPrice: _object.itemPrice,
                                soldOut: _object.soldOut,
                                stockCount: _object.stockCount,
                                itemTag: _object.itemTag)]
        return reseult
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        var identifier = ""
        let cellClass: AnyClass
        switch viewModel {
        case is BestItem: identifier = "BestItemCell"; cellClass = BestItemCell.self
        default: fatalError()
        }
        
        guard let cell = collectionContext?.dequeueReusableCell(of: cellClass,
                                                                withReuseIdentifier: identifier,
                                                                for: self,
                                                                at: index) as? UICollectionViewCell & ListBindable else  {
                                                                    print("@#4")
                                                                    fatalError()
        }
        return cell
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
        return CGSize(width: screenWidth, height: screenWidth)
    }
}
