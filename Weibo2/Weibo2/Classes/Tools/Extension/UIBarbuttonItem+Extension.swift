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
    convenience init(imageName: String,target: Any?, action: Selector?) {
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
