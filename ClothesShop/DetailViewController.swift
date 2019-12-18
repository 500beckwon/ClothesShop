//
//  DetailViewController.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2019/12/17.
//  Copyright © 2019 ByungHoon Ann. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    func customMenubar(scrollTo Index: Int) {
       
    }
    

    @IBOutlet weak var searchTextfield: UITextField!
    @IBOutlet weak var listLabel :UILabel!
    @IBOutlet weak var scrollView :UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var orderStateLabel: UILabel!
    @IBOutlet var orderPeriodButtons: [UIButton]!
    @IBOutlet var companyInfomationLabels: [UILabel]!
   
    var label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "내역이 존재하지 않습니다"
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.numberOfLines = 0
        return label
    }()
    
    let sampletablerow: [String] = []
    let samplecollrow: [String] = ["공지사항","문의/답변","상품후기","내 정보","최근본상품","관심상품","주문조회","홈"]
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setCompanyLabels()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if sampletablerow.isEmpty {
            tableView.isHidden = true
            scrollView.addSubview(label)
            label.isHidden = false
            label.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: tableView.centerYAnchor).isActive = true
        }
        
    }
    
    @IBAction func topLogoButton(_ sender: UIButton) {
        tabBarController?.selectedIndex = 0
    }
    @IBAction func searchButton(_ sender: UIButton) {
        
    }
    
}

extension DetailViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampletablerow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell") as! DetailTableCell
        
        return cell
    }
}

extension DetailViewController: UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return samplecollrow.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath) as! DetailCollectionCell
        celllayouts(cell)
        
        cell.categoryLabel.text = samplecollrow[indexPath.row]
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width/4
        let height = collectionView.frame.height/2
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}



class DetailCollectionCell : UICollectionViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
}

class DetailTableCell : UITableViewCell {
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productOption: UILabel!
    @IBOutlet weak var delivaryTrackButton: UIButton!
    @IBOutlet weak var productReview: UIButton!
    @IBOutlet weak var orderThumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}

//MARK:- UIfunction
extension DetailViewController : UITextFieldDelegate {
    
    func setCompanyLabels() {
        companyInfomationLabels[0].text = """
        고객 센터 \n 123-456-7890 \n
        상담 가능 시간
        월요일 ~ 금요일 오전
        오전 10시 ~ 오후 6시
        """
        companyInfomationLabels[1].text = """
        무통장 입금 계좌 \n 굼민 109876-54-321  예금주 : 안병훈(주)
        """
        companyInfomationLabels[2].text = """
        문의 및 반품 주소
        서울특별시 ~~로 ~~길 999 ~~건물 10층
        """
        companyInfomationLabels[3].text = """
        반품/환불 계좌
        굼민 123456-78-9101112
        예금주 : 안병훈(주)
        """
        labelLayout()
        textfieldLayout(searchTextfield)
    }
    
    func celllayouts(_ cell: UICollectionViewCell) {
        
        let layer = CALayer()
        let witdh = collectionView.frame.width/4 - 5
        let height = collectionView.frame.height/2
        layer.backgroundColor = UIColor.gray.cgColor
        layer.frame = CGRect(x: witdh , y: height/4, width: 1, height:height/2)
        
        let layer2 = CALayer()
        layer2.backgroundColor = UIColor.gray.cgColor
        layer2.frame = CGRect(x: 20, y: height - 2, width: witdh - 30, height: 1)
        cell.layer.addSublayer(layer)
        cell.layer.addSublayer(layer2)
    
    }
    
    func textfieldLayout(_ field: UITextField) {
        let border = CALayer()
        border.backgroundColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y: field.frame.maxY - 5, width: field.frame.width + 35, height: 1)
        field.layer.addSublayer(border)
    }
    
    func labelLayout() {
        guard  let companyLabel = companyInfomationLabels else {return}
        
        
        guard let viewXY = companyLabel[0].superview else { return}
        
        let border = CALayer()
        border.backgroundColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: viewXY.bounds.midX - 3, y: companyLabel[0].frame.maxY/6, width: 1, height: companyLabel[0].frame.height/6 * 4)
        viewXY.layer.addSublayer(border)
        
        let border2 = CALayer()
        border2.backgroundColor = UIColor.lightGray.cgColor
        border2.frame = CGRect(x: viewXY.bounds.midX - 3 , y: companyLabel[2].frame.minY + companyLabel[2].frame.size.height/5, width: 1, height:companyLabel[2].frame.height/5 * 3 )
        viewXY.layer.addSublayer(border2)
        
        let border3 = CALayer()
        border3.backgroundColor = UIColor.lightGray.cgColor
        border3.frame = CGRect(x: companyLabel[0].bounds.minX + companyLabel[0].frame.size.width/5 , y: companyLabel[0].frame.maxY - 2, width: companyLabel[0].frame.size.width/5 * 3, height: 1)
        companyLabel[0].layer.addSublayer(border3)
        
        let border4 = CALayer()
        border4.backgroundColor = UIColor.lightGray.cgColor
        border4.frame = CGRect(x: companyLabel[1].bounds.minX + companyLabel[0].frame.size.width/5, y: companyLabel[1].frame.maxY - 2, width: companyLabel[2].frame.size.width/5 * 3, height: 1)
        companyLabel[1].layer.addSublayer(border4)
    
    }
}
