//
//  HMTabBar.swift
//  Weibo2
//
//  Created by teacher on 16/11/12.
//  Copyright © 2016年 itcast. All rights reserved.
//

import UIKit

class HMTabBar: UITabBar {

    //修改内部视图的位置 应该重写 layoutSubviews
    override func layoutSubviews() {
        //需要super
        super.layoutSubviews()
        print(subviews)
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
    }
}
