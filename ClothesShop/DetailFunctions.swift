//
//  DetailFunctions.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2019/12/19.
//  Copyright © 2019 ByungHoon Ann. All rights reserved.
//

import Foundation
import UIKit

class DetailFunction {
    
    static let shread: DetailFunction = DetailFunction()
    
    func optionListLoad(_ code: Int) {
        
        switch code {
            
        case 0:
            print("0")
        case 1:
             print("1")
        case 2:
             print("2")
        case 3:
             print("3")
        case 4:
             print("4")
        case 5:
             print("5")
        case 6:
             print("6")
        default:
             print("7")
        }
    }
    
    func cartListLoad() {
        //장바구니 항목 로드 함수
    }
    
    func orderListLoad() {
        //주문조회 항목 로드 함수
    }
    
    func favoriteListLoad() {
        //관심상품 항목 로드 함수
    }
    
    func newsListLoad() {
        //공지사항 항목 로드 함수
    }
    
    func myQnAListLoad() {
        //문의사항 항목 로드 함수
    }
    
    func myInfomationLoad() {
        //내정보 항목 로드 함수
    }
    
    func productReviewListLoad() {
        //상품후기항목 로드 함수
    }
    
    //MARK:- 홈 화면 돌아가기 기능은 DetailViewController에서 작성할것
}
