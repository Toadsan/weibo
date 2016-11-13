//
//  QYYTabBarController.swift
//  sinaWeiBo
//
//  Created by Toad on 16/11/12.
//  Copyright © 2016年 邱银银. All rights reserved.
//

import UIKit

class QYYTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weiBoTabBar = QYYTabBar()
        
        self.setValue(weiBoTabBar, forKey: "tabBar")
        
        
        //闭包监听点击事件
        //调用self会存在循环引用,所以调用[weak self]
        weiBoTabBar.composeClpsure = { [weak self] in
            
            
            print("编辑按钮被点击了",self!)
            
        }
        
        addChildViewControllers()

    }
    
    private func addChildViewControllers() {
        
        addChildViewController(vc: QYYHomeController(), title: "首页", imageName:"tabbar_home")
        
        addChildViewController(vc: QYYMessageTableViewController(), title: "消息", imageName:"tabbar_message_center")
        
        addChildViewController(vc: QYYDiscoverTableViewController(), title: "发现", imageName:"tabbar_discover")
        
        addChildViewController(vc: QYYProfileTableViewController(), title: "我", imageName:"tabbar_profile")
        
        
    }
    
    //封装创建控制器方法
    private func addChildViewController(vc: UIViewController, title: String, imageName: String) {
        
        //设置图片
        vc.tabBarItem.image = UIImage(named: imageName)
        
        //设置选中图片
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_selected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        //设置文字颜色
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.orange], for: .selected)
        
        //设置文字大小
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName : UIFont.systemFont(ofSize: 10)], for: .normal)
        
        //设置偏移量
        vc.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
        
        //设置文字
        vc.tabBarItem.title = title
        
        vc.navigationItem.title = title
        
        let nav = QYYBaseNavController(rootViewController: vc)
        
        self.addChildViewController(nav)
        
        
    }
    



}
