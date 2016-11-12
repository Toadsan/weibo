//
//  HMTabBar.swift
//  Weibo2
//
//  Created by teacher on 16/11/12.
//  Copyright © 2016年 itcast. All rights reserved.
//

import UIKit

class HMTabBar: UITabBar {
    
    //定义闭包
    var composeClosure: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(composeBtn)
        //监听按钮的点击事件
        self.composeBtn.addTarget(self, action: #selector(composeBtnDidClick), for: .touchUpInside)
    }
    
    //不希望外界能够访问按钮的点击事件 需要设置为私有的
    //一旦添加了private 这个时候私有的方法 就对OC的运行循环不可见
    //@objc 是一个OC的标识
    //swift 会对继承自NSObject的对象的方法或者属性默认添加 @objc标识,不会对私有的属性或者方法添加@objc标识
    //添加@objc 是告诉系统这个方法或者属性具备OC特性(消息机制,KVC的动态派发)
    @objc private func composeBtnDidClick() {
        //需要跳转控制器 不能够直接在view中处理点击事件
        //应该对外抛出点击事件(代理或者闭包)
        print(#function)
        //执行闭包
        composeClosure?()
    }
    
    
    //解档的方法 系统这样做有什么意义?
    //重写了构造方法 系统就需要程序员手动实现该方法
    //一旦该视图通过xib加载程序就会崩溃
    //你写好这个视图 可能别人会使用该视图
    required init?(coder aDecoder: NSCoder) {
        //默认实现报错
        //fatalError("init(coder:) has not been implemented")
        //该控件就支持手写代码和 xib来创建
        super.init(coder: aDecoder)
        self.addSubview(composeBtn)
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
