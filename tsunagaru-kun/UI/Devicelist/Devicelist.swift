//
//  Devicelist.swift
//  tsunagaru-kun
//
//  Created by 前野友里 on 2018/09/26.
//  Copyright © 2018年 softech-teama. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class Devicelist: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
