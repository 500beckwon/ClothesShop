//
//  NewItem.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/17.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import IGListKit

class NewItem: ListDiffable {
    
    private(set) var imageURL: String
    private(set) var uploadDate: String
    private(set) var itemName:String
    private(set) var salePercent: Int
    
    init(imageURL:String, uploadDate: String, itemName: String, salePercent: Int) {
        self.imageURL = imageURL
        self.uploadDate = uploadDate
        self.itemName = itemName
        self.salePercent = salePercent
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return (itemName + uploadDate) as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? NewItem else { return false }
        return (itemName + uploadDate) == (object.itemName + object.uploadDate)
    }
    
    
}
