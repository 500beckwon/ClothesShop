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
    private(set) var itemTag: String
    init(itemImageURL:String,uploadDate: String, itemName:String, itemTag: String) {
        self.itemImageURL = itemImageURL
        self.uploadDate = uploadDate
        self.itemName = itemName
        self.itemTag = itemTag
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return (itemName + uploadDate) as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        print((itemName + uploadDate))
        guard let object = object as? BannerItem else { return false }
        print(object.itemName + object.uploadDate)
        return (itemName + uploadDate) == (object.itemName + object.uploadDate)
    }
    
    
    
}
