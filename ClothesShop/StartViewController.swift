//
//  StartViewController.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2019/12/12.
//  Copyright © 2019 ByungHoon Ann. All rights reserved.
//

import UIKit

class StartViewController: UIViewController,CustomTabBarItemDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var topMenuCollectionView:UICollectionView!
    @IBOutlet weak var bestSellerLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var ADViews: UIView!
    @IBOutlet weak var adPageControl: UIPageControl!
    @IBOutlet weak var homeButton : UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet weak var sideBarButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var adFirstImageView: UIImageView!
    @IBOutlet weak var adSecondImageView: UIImageView!
    @IBOutlet weak var adThirdImageView: UIImageView!

    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let text = ["할인제품","팬츠","티셔츠","아우터","니트","가디건","셔츠","가방","제품리뷰","문의","공지사항","이벤트"]
    var customMenuBar = CustomTabBarItem()
    var pageCollectionView : UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: collectionLayout)
        collectionLayout.scrollDirection = .horizontal
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appDelegate.startVC = self
        scrollView.delegate = self
       
        setupPageCollectionView()
        textFieldBorderCustom(field: searchTextField)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didselectView(_:)))
        ADViews.addGestureRecognizer(tap)
        
        pageCollectionView.reloadData()
    }

    @objc func didselectView(_ gesture : UITapGestureRecognizer) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ADFirstViewController") else { return}
        guard let vc2 = storyboard?.instantiateViewController(withIdentifier: "ADSecondViewController") else { return}
        guard let vc3 = storyboard?.instantiateViewController(withIdentifier: "ADThirdViewController") else { return}

        switch adPageControl.currentPage {
        case 0:
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            navigationController?.pushViewController(vc2, animated: true)
        case 2:
            navigationController?.pushViewController(vc3, animated: true)
        default:
            print("ViewController have no Storyborad ID")
        }
    }
    
    @objc func adSelectMove() {
        
    }
    
    func setADImageViews() {
        
    }
    
    func topMenuCollection() {
        topMenuCollectionView.delegate = self
        topMenuCollectionView.dataSource = self
        topMenuCollectionView.isScrollEnabled = true
        let collectionLayout = UICollectionViewFlowLayout()
        topMenuCollectionView.alwaysBounceHorizontal = true
        collectionLayout.scrollDirection = .horizontal
        topMenuCollectionView.collectionViewLayout = collectionLayout
        let nibName = UINib(nibName: "TopCell", bundle: nil)
        topMenuCollectionView.register(nibName, forCellWithReuseIdentifier: "topcell")
    }

    func setupTabBar() {
        scrollView.addSubview(customMenuBar)
        customMenuBar.delegate = self
        customMenuBar.translatesAutoresizingMaskIntoConstraints = false
        
        customMenuBar.indicatorViewWidthConstraint.constant = view.frame.width / 4
        customMenuBar.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        customMenuBar.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        customMenuBar.topAnchor.constraint(equalTo: bestSellerLabel.bottomAnchor).isActive = true
        customMenuBar.heightAnchor.constraint(equalToConstant: 60).isActive = true
        customMenuBar.indicator.layer.cornerRadius = 5
    }
    
    func setupPageCollectionView() {
        setupTabBar()
        topMenuCollection()
        let nibName = UINib(nibName: "PageCollectionView", bundle: nil)
        scrollView.addSubview(pageCollectionView)
        pageCollectionView.register(nibName, forCellWithReuseIdentifier: "pagecell")

        pageCollectionView.delegate = self
        pageCollectionView.dataSource = self
        pageCollectionView.showsHorizontalScrollIndicator = false
        pageCollectionView.backgroundColor = .gray
        
        pageCollectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        pageCollectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        pageCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        pageCollectionView.topAnchor.constraint(equalTo: customMenuBar.bottomAnchor,constant: 5).isActive = true
    }
    
    func customMenubar(scrollTo Index: Int) {
        let indexPath = IndexPath(row: Index, section: 0)
        pageCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        customMenuBar.indicatorViewLeadingConstraint.constant = scrollView.contentOffset.x / 4
    }
  
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let itemAt = Int(targetContentOffset.pointee.x / view.frame.width)
        let indexPath = IndexPath(item: itemAt, section: 0)
        customMenuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
    }
    
}
extension StartViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == pageCollectionView {
            return 4
        }
        
        if collectionView == topMenuCollectionView {
            return text.count
        }
        return 0 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
        if collectionView == pageCollectionView {
            let cell = pageCollectionView.dequeueReusableCell(withReuseIdentifier: "pagecell", for: indexPath) as! PageCollectionCell
            
            cell.label.text = "\(indexPath.row + 1) View"
            return cell
        }
        
        if collectionView == topMenuCollectionView {
            let cell = topMenuCollectionView.dequeueReusableCell(withReuseIdentifier: "topcell", for: indexPath) as! TopMenuCollectionCell
            cell.label.text = text[indexPath.row]
            return cell
        }
        
        return UICollectionViewCell()
        
    }
    
}

extension StartViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == pageCollectionView {
        return CGSize(width: pageCollectionView.frame.width, height: pageCollectionView.frame.height)
        }
        
        if collectionView == topMenuCollectionView {
            return CGSize(width: 50, height: 45)
        }
        return CGSize(width: 10, height: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension StartViewController: UITextFieldDelegate {
    func textFieldBorderCustom(field : UITextField) {
        field.borderStyle = .none
        let border = CALayer()
        border.backgroundColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y: field.frame.size.height - 1 , width: field.frame.size.width + 35, height: 1)
        
        field.layer.addSublayer(border)
    }
}

class TopMenuCollectionCell: UICollectionViewCell {
    
    var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(label)
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}

class PageCollectionCell : UICollectionViewCell {
    var label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(label)
        self.isUserInteractionEnabled = true
        label.backgroundColor = .clear
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
