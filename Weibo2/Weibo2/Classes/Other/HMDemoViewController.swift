//
//  HMDemoViewController.swift
//  Weibo2
//
//  Created by teacher on 16/11/12.
//  Copyright © 2016年 itcast. All rights reserved.
//

import UIKit

class HMDemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_back_withtext", target: self, action: #selector(back))
        //let itm1 = UIBarButtonItem(age: 0, imageName: "xxx", target: self, action: #selector(back))
    }
    
    @objc private func back() {
        _ = self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
