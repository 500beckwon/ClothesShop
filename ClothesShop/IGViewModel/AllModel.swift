//
//  AllModel.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2020/08/23.
//  Copyright © 2020 ByungHoon Ann. All rights reserved.
//

import Foundation
import Foundation
import IGListKit
struct AllModel {
    static let objects: [ListDiffable] =
        [
            BannerItem(itemImageURL: "1", uploadDate: "2020-08-23", itemName: "2", itemTag: "3"),
            DailyItem(itemImageURL: ["1"], uploadDate: "2020-08-23", itemName: "4", itemPrice: 10, stockCount: 100, itemTag: "6"),
            BestItem(itemImageURL: ["7"], uploadDate: "2020-08-23", itemName: "5", itemPrice: 10, soldOut: false, stockCount: 100, itemTag: "8"),
            NewItem(imageURL: ["111"], uploadDate: "2020-08-23", itemName: "123", salePercent: 5, itemTag: "45",itemPrice: 10)
    ]
}
