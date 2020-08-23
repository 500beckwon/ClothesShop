//
//  BaseItem.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/17.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import IGListKit

class BaseItem: ListDiffable {
    
    private(set) var newItem: [NewItem]
    private(set) var bestItem: [BestItem]
    private(set) var bannerItem: [BannerItem]
    private(set) var dailyItem: [DailyItem]
    private(set) var updateDate: String
    private(set) var updateManeger: String
    init(newItem:[NewItem], bestItem: [BestItem], bannerItem: [BannerItem], dailyItem: [DailyItem] , updateDate: String, updateManeger: String) {
        self.newItem = newItem
        self.bestItem = bestItem
        self.bannerItem = bannerItem
        self.dailyItem = dailyItem
        self.updateDate = updateDate
        self.updateManeger = updateManeger
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return (updateDate + updateManeger) as NSObject
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return true
    }
}
