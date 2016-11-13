//
//  QYYTabBar.swift
//  sinaWeiBo
//
//  Created by Toad on 16/11/12.
//  Copyright © 2016年 邱银银. All rights reserved.
//


//自定义TabBar
import UIKit

class QYYTabBar: UITabBar {

    var composeClpsure: (() -> ())?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.addSubview(composeBtn)
        
        //添加监听方法
        self.composeBtn.addTarget(self, action: #selector(composeBtnDidClick), for: .touchUpInside)
    }
    
    @objc private func composeBtnDidClick() {
        
        //这个View中不应该处理点击事件,所以使用闭包抛出点击事件
        print(#function)

        //执行闭包
        composeClpsure?()
    }
    
    
    //只允许使用纯代码去创建
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //因为要修改内部子视图的位置
    override func layoutSubviews() {
     
        super.layoutSubviews()
        
        let w = UIScreen.main.bounds.width / 5
        
        let h = self.bounds.height
        
        var index = 0
        
        //遍历子视图
        
        for subView in subviews {
            
            if subView.isKind(of: NSClassFromString("UITabBarButton")!) {
                
                //修改原本tabBar的fram
                subView.frame = CGRect(x: CGFloat(index) * w, y: 0, width: w, height: h)
                
                index += (index == 1 ? 2 : 1)
            }
        }
        
        
        //设置编辑按钮的fram
        composeBtn.bounds.size = CGSize(width: w, height: h)
        
        composeBtn.center = CGPoint(x: self.center.x, y: h * 0.5)
    }
    
    
    //懒加载按键
    lazy var composeBtn: UIButton = {
        
        let btn = UIButton()
        
        btn.setImage(#imageLiteral(resourceName: "tabbar_compose_icon_add"), for: .normal)
        
        btn.setImage(#imageLiteral(resourceName: "tabbar_compose_icon_add_highlighted"), for: .highlighted)
        
        btn.setBackgroundImage(#imageLiteral(resourceName: "tabbar_compose_button"), for: .normal)
        
        btn.setBackgroundImage(#imageLiteral(resourceName: "tabbar_compose_button_highlighted"), for: .highlighted)
        
        return btn
        
    }()

}
