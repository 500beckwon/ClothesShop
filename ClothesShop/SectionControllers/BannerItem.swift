//
//  BannerItem.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/17.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import IGListKit

class BannerItem: ListDiffable {
    private(set) var itemImageURL: String
    private(set) var uploadDate: String
    private(set) var itemName: String
    
    init(itemImageURL:String,uploadDate: String, itemName:String) {
        self.itemImageURL = itemImageURL
        self.uploadDate = uploadDate
        self.itemName = itemName
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return (itemName + uploadDate) as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? BestItem else { return false }
        return (itemName + uploadDate) == (object.itemName + object.uploadDate)
    }
    
    
    
}
