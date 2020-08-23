//
//  ShopDataSource.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/23.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import IGListKit

public class ShopDataSource: NSObject, ListAdapterDataSource {
    public func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return AllModel.objects
    }
    
    public func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is BannerItem:
            return BannerItemSectionController()
        case is DailyItem:
            return DailyItemSectionController()
        case is BestItem:
            return BestItemSectionController()
        case is NewItem:
            return NewItemSectionController()
        default: return ListSectionController()
        }
    }
    
    public func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    
}
