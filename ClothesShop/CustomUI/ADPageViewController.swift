//
//  ADPageViewController.swift
//  ClothesShop
//
//  Created by ByungHoon Ann on 2019/12/16.
//  Copyright © 2019 ByungHoon Ann. All rights reserved.
//

import Foundation
import UIKit
class ADPageViewController:  UIPageViewController , UIPageViewControllerDataSource,UIPageViewControllerDelegate {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //MARK:- tag [0,1,2]
    lazy var viewcontrollerList: [UIViewController] = {
       let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc1 = sb.instantiateViewController(withIdentifier: "ADFirstViewController")
        let vc2 = sb.instantiateViewController(withIdentifier: "ADSecondViewController")
        let vc3 = sb.instantiateViewController(withIdentifier: "ADThirdViewController")
        return [vc1,vc2,vc3]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        
        if let firstVC = viewcontrollerList.first {
            self.setViewControllers([firstVC], direction: .forward, animated: true)
        }
    }
   
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed == true {
            guard let currentTag = pageViewController.viewControllers?.first!.view.tag else { return}
            //appDelegate.startVC?.adPageControl.currentPage = currentTag
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewcontrollerList.firstIndex(of:viewController) else { return  nil}
        let previousIndex = vcIndex - 1
        guard previousIndex >= 0 else { return nil}
        return viewcontrollerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewcontrollerList.firstIndex(of: viewController) else { return nil}
        let after = vcIndex + 1
        guard viewcontrollerList.count != after else { return nil}
        return viewcontrollerList[after]
    }
    
    
}
