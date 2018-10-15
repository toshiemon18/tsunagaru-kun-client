//
//  LoginViewController.swift
//  tsunagaru-kun
//
//  Created by 前野友里 on 2018/09/12.
//  Copyright © 2018年 softech-teama. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ passwordField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func tapLoginButton(_ sender: Any) {
        print("ボタンが押されたよ")
        print(self.emailField.text!)
        let email:String = self.emailField.text!
        let password:String = self.passwordField.text!
        let headers =  [ "Content-Type": "application/json" ]
        let params: Parameters = [
        "email": email,
        "password": password
        ]
           let userDefaults = UserDefaults.standard
        Alamofire.request("\(BASE_URL)/v1/auth/sign_in", method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            guard let object = response.result.value else {
                return
            }
            let json = JSON(object)
            
            if json["errors"] == JSON.null {
                guard let allHeaderFields = response.response?.allHeaderFields else {
                    return
                }
                
                let client = allHeaderFields["client"]!
                let token = allHeaderFields["access-token"]!
                let uid = allHeaderFields["uid"]!
                
                userDefaults.setValue(client, forKey: "client")
                userDefaults.setValue(token, forKey: "access-token")
                userDefaults.setValue(uid, forKey: "uid")
                userDefaults.setValue(true, forKey: "login")
                
                print("Signed in as \(uid)")
                let storyboard: UIStoryboard = UIStoryboard(name: "Devicelist", bundle: nil)
                let next: UIViewController = (storyboard.instantiateInitialViewController())!
                self.present(next, animated: true, completion: nil)
            } else {
                let errors = json["errors"].arrayValue.map { $0.stringValue }
                let message = errors.joined(separator: "\n")
                let alertController = UIAlertController(title: "エラー", message: message, preferredStyle: UIAlertControllerStyle.alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
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
