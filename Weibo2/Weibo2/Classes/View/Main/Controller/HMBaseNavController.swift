//
//  HMBaseController.swift
//  Weibo2
//
//  Created by teacher on 16/11/12.
//  Copyright © 2016年 itcast. All rights reserved.
//

import UIKit

class HMBaseNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //重写push方法
    //说明UINavigationController(rootViewController:) 内部执行了push的操作
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        let count = childViewControllers.count
        if count > 0 {
            //统一操作
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title:"返回",imageName: "navigationbar_back_withtext", target: self, action: #selector(back))
            //隐藏底部的tabbar 
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc private func back() {
        popViewController(animated: true)
    }

}
