//
//  QYYBaseNavController.swift
//  sinaWeiBo
//
//  Created by Toad on 16/11/12.
//  Copyright © 2016年 邱银银. All rights reserved.
//

import UIKit

class QYYBaseNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        let count = childViewControllers.count
        
        if count > 0 {
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(titlr: "返回", imageNeme: "navigationbar_back_withtext", target: self, action: #selector(back))
            
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
        
    }
    
    @objc private func back() {
        
        popViewController(animated: true)
    }

}
