//
//  BestItem.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/17.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import IGListKit

class BestItem: ListDiffable {
    private(set) var itemImageURL: [String]
    private(set) var uploadDate: String
    private(set) var itemName: String
    private(set) var itemPrice: String
    private(set) var soldOut: Bool
    private(set) var stockCount:UInt
    init(itemImageURL:[String],uploadDate: String, itemName:String,itemPrice:String, soldOut:Bool,stockCount:UInt ) {
        self.itemImageURL = itemImageURL
        self.uploadDate = uploadDate
        self.itemName = itemName
        self.itemPrice = itemPrice
        self.soldOut = soldOut
        self.stockCount = stockCount
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return (itemName + uploadDate) as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? BestItem else { return false }
        return (itemName + uploadDate) == (object.itemName + object.uploadDate)
    }
}
