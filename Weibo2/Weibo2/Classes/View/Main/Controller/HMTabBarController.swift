//
//  HMTabBarController.swift
//  Weibo2
//
//  Created by teacher on 16/11/12.
//  Copyright © 2016年 itcast. All rights reserved.
//

import UIKit

class HMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置渲染
        //tabBar.tintColor = UIColor.orange
        addChildViewControllers()
    }
    
    //添加子视图控制器
    //private 不希望外界能够访问到该方法, 只能在本类中访问
    private func addChildViewControllers() {
        addChildViewController(vc: HMHomeTableViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(vc: HMMessageTableViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(vc: HMDiscoverTableViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(vc: HMProfileTableViewController(), title: "我", imageName: "tabbar_profile")
    }
    
    //MARK: 添加子视图控制器
    private func addChildViewController(vc: UIViewController, title: String, imageName: String) {
        //设置title
        //vc.title = "首页"
        //需要同时设置title和图片才能够显示
        vc.tabBarItem.image = UIImage(named: imageName)
        //设置选中的image
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_selected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        //设置文字颜色
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.orange], for: .selected)
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName : UIFont.systemFont(ofSize: 10)], for: .normal)
        vc.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
        vc.tabBarItem.badgeValue = "10"
        vc.tabBarItem.badgeValue = nil
        vc.tabBarItem.badgeColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        vc.tabBarItem.title = title
        vc.navigationItem.title = title
        //设置图片的偏移
        //vc.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        //2.将tableVC包装到 导航控制器
        let nav = UINavigationController(rootViewController: vc)
        //3.将导航控制器添加到 UITabBarController对象的子视图控制器
        self.addChildViewController(nav)
    }

}