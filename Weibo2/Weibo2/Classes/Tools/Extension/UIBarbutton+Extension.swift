//
//  UIBarbutton+Extension.swift
//  sinaWeiBo
//
//  Created by Toad on 16/11/12.
//  Copyright © 2016年 邱银银. All rights reserved.
//

//这个分类是为了给UIBarbutton扩展构造方法的

import UIKit

extension UIBarButtonItem {
    
    //函数的参数设置默认值,系统是会自动生成一个不带这个参数的方法的
    convenience init(titlr: String = "", imageNeme: String,target: Any?, action: Selector?) {
        
        let btn = UIButton()
        
        btn.setTitle(titlr, for: .normal)
        
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        
        btn.setTitleColor(UIColor.orange, for: .highlighted)
        
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        //设置图片
        btn.setImage(UIImage(named: imageNeme), for: .normal)
        
        btn.setImage(UIImage(named: imageNeme + "_highlighted"), for: .highlighted)
        
        if let ac = action {
            
            btn.addTarget(target, action: ac, for: .touchUpInside)
        }
        
        btn.sizeToFit()
        
        self.init()
        
        self.customView = btn
        
    }
}
