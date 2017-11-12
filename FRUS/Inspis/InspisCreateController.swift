//
//  ViewController.swift
//  FRUS
//
//  Created by かわゆた on 2017/05/16.
//  Copyright © 2017 かわゆた. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class InspisCreateController: UIViewController {
    
    let adress:String = "http://127.0.0.1:3000"
    var params: [String : AnyObject] = [:]
    
    @IBOutlet weak var notice: UILabel!
    
    @IBOutlet weak var input_Value: UITextField!
    @IBOutlet weak var input_Value2: UITextField!
    @IBOutlet weak var input_Password: UITextField!
    @IBOutlet weak var input_PasswordConfilm: UITextField!
    
    @IBOutlet weak var result_Value: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if(view.restorationIdentifier == "new") {
            self.input_Value.placeholder = "Username"
            self.input_Value2.placeholder = "MailAdress"
            self.input_Password.placeholder = "Password"
            self.input_PasswordConfilm.placeholder = "Password Confilm"
        } else if(view.restorationIdentifier == "result") {
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    @IBAction func Post(_ sender: Any) {
        
        var parameters = [
            "name": 0,
            "email": 0,
            "password": 0,
            "password_confirmation": 0
            ] as [String : Any]
      
        parameters["username"] = self.input_Value.text
        parameters["email"] = self.input_Value2.text
        parameters["password"] = self.input_Password.text
        parameters["password_confirmation"] = self.input_PasswordConfilm.text
        
        Alamofire.request("\(self.adress)/users/sign_up.json", method: .post, parameters: ["users": parameters]).responseJSON {
            response in
            switch response.result {
            case .success:
                print(response)
                self.params = response.result.value as! Dictionary
                self.performSegue(withIdentifier: "toInspisShow", sender: nil)
                self.notice.text = "登録完了しました。"
                break
            case .failure(let error):
                print(error)
                self.notice.text = "投稿に失敗しました。"
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller:InspisShowController = segue.destination as! InspisShowController
        controller.parameters = params
        controller.notices = self.notice.text!
    }
    
    
}


