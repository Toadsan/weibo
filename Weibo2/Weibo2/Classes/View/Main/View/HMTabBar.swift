//
//  HMTabBar.swift
//  Weibo2
//
//  Created by teacher on 16/11/12.
//  Copyright © 2016年 itcast. All rights reserved.
//

import UIKit

class HMTabBar: UITabBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(composeBtn)
        
    }
    
    
    //解档的方法 系统这样做有什么意义?
    required init?(coder aDecoder: NSCoder) {
        //默认实现报错
        fatalError("init(coder:) has not been implemented")
    }
    
    //手写代码创建视图,不会执行这个方法
    override func awakeFromNib() {
        
    }

    //修改内部视图的位置 应该重写 layoutSubviews
    //布局
    override func layoutSubviews() {
        //需要super
        super.layoutSubviews()
        //print(subviews)
        //需要获取 UITabBarButton类型的控件 并且修改frame
        //遍历子视图
        let w = UIScreen.main.bounds.width / 5
        let h = self.bounds.height
        var index = 0
        for subView in subviews {
            //判断类型
            if subView.isKind(of: NSClassFromString("UITabBarButton")!) {
                //修改frame
                subView.frame = CGRect(x: CGFloat(index) * w, y: 0, width: w, height: h)
                /*
                if index == 1 {
                    index += 1
                }
                index += 1
                */
                index += (index == 1 ? 2 : 1)
            }
        }
        
        //设置撰写按钮的frame
        composeBtn.bounds.size = CGSize(width: w, height: h)
        //print(self.center)
        composeBtn.center = CGPoint(x: self.center.x, y: h * 0.5)
    }
    
    //懒加载按钮
    lazy var composeBtn: UIButton = {
        let btn = UIButton()
        //设置图片
        btn.setImage(#imageLiteral(resourceName: "tabbar_compose_icon_add"), for: .normal)
        btn.setImage(#imageLiteral(resourceName: "tabbar_compose_icon_add_highlighted"), for: .highlighted)
        //设置背景图片
        btn.setBackgroundImage(#imageLiteral(resourceName: "tabbar_compose_button"), for: .normal)
        btn.setBackgroundImage(#imageLiteral(resourceName: "tabbar_compose_button_highlighted"), for: .highlighted)
        //btn.sizeToFit()
        return btn
    
    }()
}