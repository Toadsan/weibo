//
//  UIBarbuttonItem+Extension.swift
//  Weibo2
//
//  Created by teacher on 16/11/12.
//  Copyright © 2016年 itcast. All rights reserved.
//

import UIKit

//给UIBarbuttonItem扩展构造方法
extension UIBarButtonItem {
    
    //分类中不能够声明指定的构造器
    //函数使用的大招
    //给函数的参数设置默认值 系统自动会生成一个不带该参数的方法
    convenience init(title: String = "", imageName: String,target: Any?, action: Selector?) {
        let btn = UIButton()
        //设置按钮
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        //监听按钮的点击事件
        if let ac = action {
            btn.addTarget(target, action: ac, for: .touchUpInside)
        }
        btn.sizeToFit()
        
        self.init()
        self.customView = btn
    }
}
