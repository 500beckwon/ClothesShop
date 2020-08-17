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
    
    init(newItem:[NewItem], bestItem: [BestItem], bannerItem: [BannerItem]) {
        self.newItem = newItem
        self.bestItem = bestItem
        self.bannerItem = bannerItem
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        <#code#>
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        <#code#>
    }
}
