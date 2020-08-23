//
//  DailyItem.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/23.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import IGListKit

class DailyItem: ListDiffable {
    private(set) var itemImageURL: [String]
    private(set) var uploadDate: String
    private(set) var itemName: String
    private(set) var itemPrice: Int
    private(set) var stockCount:UInt
    private(set) var itemTag: String
    
    init(itemImageURL: [String], uploadDate: String, itemName: String, itemPrice: Int,stockCount:UInt, itemTag:String) {
        self.itemImageURL = itemImageURL
        self.uploadDate = uploadDate
        self.itemName = itemName
        self.itemPrice = itemPrice
        self.stockCount = stockCount
        self.itemTag = itemTag
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        print("데일리",itemPrice,itemName)
        return (itemName + uploadDate) as NSObject
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? DailyItem else { return false }
        return (itemName + uploadDate) == (object.itemName + object.uploadDate)
    }
}
