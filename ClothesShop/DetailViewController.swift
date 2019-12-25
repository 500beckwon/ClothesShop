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
    let DetailTableCell = "tablecell" // 주문조회용 cell
    let productCell = "productDetailCell" //상품 이미지들 셀
    
    @IBOutlet weak var tableViewTopNSLayout: NSLayoutConstraint!
    @IBOutlet weak var topImageViewNSLayoutHeight: NSLayoutConstraint!
    @IBOutlet weak var ContentViewheightNSLayout: NSLayoutConstraint!
    @IBOutlet weak var orderListButtonNSLayout: NSLayoutConstraint!
    @IBOutlet weak var periodContentViewNSLayout: NSLayoutConstraint!
    
    @IBOutlet weak var logoButton: UIButton!
    @IBOutlet weak var searchTextfield: UITextField!
    @IBOutlet weak var listLabel :UILabel!
    @IBOutlet weak var scrollView :UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var orderStateLabel: UILabel!
    @IBOutlet weak var orderListButton: UIButton!
    @IBOutlet weak var cancelorderListButton: UIButton!
    @IBOutlet var orderPeriodButtons: [UIButton]!
    @IBOutlet var companyInfomationLabels: [UILabel]!
    @IBOutlet weak var periodContentView: UIView!
    @IBOutlet weak var scrollContentView: UIView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyInfomationView: UIView!
    @IBOutlet weak var topImageView: UIImageView!
    
    let sampletest = ["test1","test2","test3"]
    var indCode : Int? //collect didselect 제어 변수
    var productCode: Int? //productCell 출현 제어 함수
    var topImage: UIImage?
    var samplecode = ""
    var label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.isHidden = true
        label.text = "내역이 존재하지 않습니다"
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.numberOfLines = 0
        return label
    }()
    
    var imageView : UIImageView = {
       let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleToFill
        return imageview
    }()
    
    let sampletablerow: [String] = []
    let samplecollrow: [String] = ["공지사항","문의/답변","상품후기","내 정보","최근본상품","관심상품","주문조회","홈"]
    override func viewDidLoad() {
        super.viewDidLoad()
       
        periodContentView.accessibilityIdentifier = "PeriodContentView Test"
        companyInfomationView.accessibilityIdentifier = "InfomationView Test"
        scrollContentView.accessibilityIdentifier = "ContentView Test"
        scrollView.accessibilityIdentifier = "scrollView Test"
        companyNameLabel.accessibilityIdentifier = "companyNameLabel Test"
        topImageView.accessibilityIdentifier = "topImageView Test"
        tableView.accessibilityIdentifier = "tableView Test"
        topImageView.isHidden = true
        setCompanyLabels()
        
        if topImageView.isHidden == true {
            ContentViewheightNSLayout.constant = 1350 - topImageViewNSLayoutHeight.constant
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if sampletablerow.isEmpty && samplecode == ""{
            tableView.isHidden = true
            scrollView.addSubview(label)
            label.isHidden = false
            label.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: tableView.centerYAnchor).isActive = true
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()

        if topImage != nil {
            topImageView.isHidden = false
            ContentViewheightNSLayout.constant = ContentViewheightNSLayout.constant + topImageViewNSLayoutHeight.constant
            topImageView.image = topImage
    
        }

        if let intCode = indCode {
            DetailFunction.shread.optionListLoad(intCode)
            tableView.isHidden = false
            label.isHidden = true
            
            tableView.reloadData()
        }
    }
    
    
    @IBAction func topLogoButton(_ sender: UIButton) {
        
        if indCode != nil {
            navigationController?.popToRootViewController(animated: true)
        }else {
            tabBarController?.selectedIndex = 0
        }
    }
    
    @IBAction func searchButton(_ sender: UIButton) {
        
    }
    
    @IBAction func orderListButton(_ sender: UIButton) {
    }
    
    @IBAction func cancelorderListButton(_ sender: Any) {
    }
    
   
}

extension DetailViewController : UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        
        if productCode != nil {
            return 2
            }else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
            if indCode != nil {
                return sampletest.count
            }
                
            else {
                return sampletablerow.count
            }
        
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell") as? DetailTableCell else { return UITableViewCell() }
        
        if indCode != nil {
            
            cell.productNameLabel.text = sampletest[indexPath.row]
        }
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
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.indCode = indexPath.row
        vc.topImage = UIImage(named: "냥1.jpeg")
       
        navigationController?.pushViewController(vc, animated: true)
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
class ProductDetailCell : UITableViewCell {
    @IBOutlet weak var productImageView : UIImageView!
    @IBOutlet weak var productInfomatonLabel: UILabel!
    
    
}
//MARK:- UIfunction
extension DetailViewController : UITextFieldDelegate {

    
    //MARK:- 최하단측 label에 들어갈  회사 정보 text
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
        
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = UIColor.black.cgColor
        
        labelLayout()
        textfieldLayout(searchTextfield)
    }
    
    //MARK:- 최하단 항목 바로 위의 8개의 collectionCell 레이아웃
    func celllayouts(_ cell: UICollectionViewCell) {
        
        let layer = CALayer()
        let witdh = collectionView.bounds.width/4 - 5
        let height = collectionView.bounds.height/2
        layer.backgroundColor = UIColor.gray.cgColor
        layer.frame = CGRect(x: witdh , y: height/4, width: 1, height:height/2)
        
        let layer2 = CALayer()
        layer2.backgroundColor = UIColor.gray.cgColor
        layer2.frame = CGRect(x: 20, y: height - 2, width: witdh - 30, height: 1)
        cell.layer.addSublayer(layer)
        cell.layer.addSublayer(layer2)
    }
    
    //FIXME: -임시 textfield 레이아웃, 돋보기 이미지를 넣어서 클릭시 최상단 바가 택스트필드로 전환되게 수정
    func textfieldLayout(_ field: UITextField) {
        let border = CALayer()
        border.backgroundColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y: field.bounds.maxY - 5, width: field.frame.width + 35, height: 1)
        field.layer.addSublayer(border)
    }
    
    func labelLayout() {
        guard  let companyLabel = companyInfomationLabels else {return}
        guard let viewXY = companyLabel[0].superview else { return}
        
        orderListButton.layer.borderWidth = 0.5
        cancelorderListButton.layer.borderWidth = 0.5
        
        orderPeriodButtons[0].layer.borderColor = UIColor.black.cgColor
        orderPeriodButtons[0].layer.borderWidth = 0.5
        orderPeriodButtons[1].layer.borderColor = UIColor.black.cgColor
        orderPeriodButtons[1].layer.borderWidth = 0.5
        orderPeriodButtons[2].layer.borderColor = UIColor.black.cgColor
        orderPeriodButtons[2].layer.borderWidth = 0.5
        orderPeriodButtons[3].layer.borderColor = UIColor.black.cgColor
        orderPeriodButtons[3].layer.borderWidth = 0.5
        orderPeriodButtons[4].layer.borderColor = UIColor.black.cgColor
        orderPeriodButtons[4].layer.borderWidth = 0.5
        
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
    
    //MARK: - 테스트용 레이아웃 코드
    /*
    func scrollViewLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: logoButton.bottomAnchor,constant: 70).isActive = true
        scrollView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        scrollContentView.translatesAutoresizingMaskIntoConstraints = false
        scrollContentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollContentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 1000).isActive = true
       
        periodContentView.translatesAutoresizingMaskIntoConstraints = false
        periodContentView.topAnchor.constraint(equalTo: scrollContentView.topAnchor,constant: 50).isActive = true
        periodContentView.bottomAnchor.constraint(equalTo: tableView.topAnchor).isActive = true
        periodContentView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor).isActive = true
        periodContentView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor).isActive = true
        periodContentView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        scrollContentView.translatesAutoresizingMaskIntoConstraints = false
        scrollContentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollContentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 1000).isActive = true
        
        
        cancelorderListButton.translatesAutoresizingMaskIntoConstraints = false
        cancelorderListButton.topAnchor.constraint(equalTo: scrollContentView.topAnchor,constant: 10).isActive = true
        cancelorderListButton.bottomAnchor.constraint(equalTo: periodContentView.topAnchor,constant: -10).isActive = true
        cancelorderListButton.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor,constant: -10).isActive = true
        cancelorderListButton.leadingAnchor.constraint(equalTo: orderListButton.trailingAnchor,constant: -10).isActive = true
        cancelorderListButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        cancelorderListButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        orderListButton.translatesAutoresizingMaskIntoConstraints = false
        orderListButton.topAnchor.constraint(equalTo: scrollContentView.topAnchor, constant:  10).isActive = true
        orderListButton.bottomAnchor.constraint(equalTo: periodContentView.topAnchor,constant: -10).isActive = true
        orderListButton.trailingAnchor.constraint(equalTo: cancelorderListButton.leadingAnchor).isActive = true
        orderListButton.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor,constant: 10).isActive = true
        orderListButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        orderListButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
       
        periodContentView.translatesAutoresizingMaskIntoConstraints = false
        
        periodContentView.topAnchor.constraint(equalTo: orderListButton.bottomAnchor,constant: 10).isActive = true
        periodContentView.bottomAnchor.constraint(equalTo: tableView.topAnchor,constant: 10).isActive = true
        periodContentView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor).isActive = true
        periodContentView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor).isActive = true
        periodContentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        
        listLabel.translatesAutoresizingMaskIntoConstraints = false
        listLabel.topAnchor.constraint(equalTo: logoButton.bottomAnchor,constant: 10).isActive = true
        listLabel.bottomAnchor.constraint(equalTo: scrollView.topAnchor,constant: 20).isActive = true
      
        listLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        companyNameLabel.bottomAnchor.constraint(equalTo: scrollContentView.bottomAnchor).isActive = true
    }
    
    func textlayout() {
        cancelorderListButton.isHidden = true
        orderListButton.isHidden = true
        periodContentView.isHidden = true
        listLabel.isHidden = true
        scrollView.topAnchor.constraint(equalTo: logoButton.bottomAnchor,constant: 1).isActive = true

        scrollContentView.addSubview(imageView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.topAnchor.constraint(equalTo: scrollContentView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: tableView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
       
        tableView.bottomAnchor.constraint(equalTo: collectionView.topAnchor,constant: 10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor).isActive = true
        
        collectionView.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: scrollView.topAnchor,multiplier: 1).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: companyInfomationView.topAnchor).isActive = true
        companyInfomationView.bottomAnchor.constraint(equalTo: companyNameLabel.topAnchor).isActive = true
        companyNameLabel.bottomAnchor.constraint(equalTo: scrollContentView.bottomAnchor,constant: 10).isActive = true
        companyNameLabel.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor).isActive = true
        companyNameLabel.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor).isActive = true
        imageView.image = topImage

    }
 */
}
