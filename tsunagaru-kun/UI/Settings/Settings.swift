//
//  File.swift
//  tsunagaru-kun
//
//  Created by 前野友里 on 2018/10/09.
//  Copyright © 2018年 softech-teama. All rights reserved.
//

import Foundation
import UIKit
class Settings: Settings,UITableViewDelegate,UITableViewDataSource {

    let AllSettings = ["通知設定","一般設定"]

    override func viewDidLoad(){
        super.viewDidLoad()
}

    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
}

func tableView(tableView:UITableView, numberOfRowsInSection section :Int) -> Int {
    return AllSettings.count
}

func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell{
    
    let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Settings", forIndexPath: indexPath)
    cell.textLabel!.text = fruits[indexPath.row]

    return cell
}

func tableView(tableView: UITableview,didSerectRowAtIndexPath indexPath: NSIndexPath) {
}
