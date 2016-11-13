//
//  QYYHomeController.swift
//  sinaWeiBo
//
//  Created by Toad on 16/11/12.
//  Copyright © 2016年 邱银银. All rights reserved.
//

import UIKit

class QYYHomeController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(imageNeme: "navigationbar_pop", target: self, action: #selector(push))


    }

    @objc private func push() {
        
        let pop = QYYPOPViewController()
        
        self.navigationController?.pushViewController(pop, animated: true)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

   

}
