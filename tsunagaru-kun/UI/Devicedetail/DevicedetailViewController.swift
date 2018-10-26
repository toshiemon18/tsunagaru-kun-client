//
//  DevicedetailViewController.swift
//  tsunagaru-kun
//
//  Created by SeinoToshiaki on 2018/10/26.
//  Copyright © 2018 softech-teama. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class DevicedetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var detailTable: UITableView!
    
    let evaluationStrs = ["電圧[V]", "電流量[A]", "有効電力[W]",
                          "換算電力量[W]", "電気料金[円/月]", "CO2排出量[kg]",
                          "待機時間[h]", "待機時の消費電力[W]"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return evaluationStrs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = evaluationStrs[indexPath.row]
        cell.detailTextLabel?.text = "10"
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func fetchDeviceDetails() {
        var headers = ["Content-Type": "application/json"]
        let userDefaults = UserDefaults.standard
        headers["client"] = userDefaults.string(forKey: "client")
        headers["access-token"] = userDefaults.string(forKey: "access-token")
        headers["uid"] = userDefaults.string(forKey: "uid")
        
        Alamofire.request("\(BASE_URL)/v1/devices/1", method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            guard let object = response.result.value else {
                return
            }
            let json = JSON(object)
            
            if json["errors"] == JSON.null {
                
            }
            else {
                // TODO: Implement!!!!
            }
        }
    }
}
