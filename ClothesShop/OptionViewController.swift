//
//  OptionViewController.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2019/12/24.
//  Copyright © 2019 ByungHoon Ann. All rights reserved.
//

import UIKit

class OptionViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    let firstSectionData: [String] = ["쇼핑몰 소식","알림메세지","고객센터"]
    let secondSectionData: [String] = ["로그아웃","알림 수신 동의"]
    let thirdSectionData: [String] = ["문의/상담 게시판","상품 리뷰"]
    let forthSectionData: [String] = ["현재버전"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return firstSectionData.count
        case 1:
            return secondSectionData.count
        case 2:
            return thirdSectionData.count
        case 3:
            return forthSectionData.count
        default:
            print("section.count = 4")
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionView = [" "," "," "," "]
        return sectionView[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "optioncell") as! OptionTableCell
        if indexPath.section == 0 {
            cell.optionNamelabel.text = firstSectionData[indexPath.row]
        } else if indexPath.section == 1 {
            cell.optionNamelabel.text = secondSectionData[indexPath.row]
        } else if indexPath.section == 2 {
            cell.optionNamelabel.text = thirdSectionData[indexPath.row]
        }else {
            cell.optionNamelabel.text = forthSectionData[indexPath.row]
        }
        return cell
    }

  
}

class OptionTableCell: UITableViewCell {
    @IBOutlet weak var optionNamelabel: UILabel!
    
}
