//
//  AppFullscreenController.swift
//  Appstore
//
//  Created by OYEGOKE TOMISIN on 29/05/2019.
//  Copyright © 2019 com.OyegokeTomisin. All rights reserved.
//

import UIKit

class AppFullscreenController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            let cell = UITableViewCell()
            let header = TodayCell()
            cell.addSubview(header)
            header.centerInSuperview(size: .init(width: 250, height: 250))
            return cell
        }
        
        let cell = AppFullscreenDescriptionCell()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
}
