//
//  ViewController.swift
//  FRUS
//
//  Created by かわゆた on 2017/05/16.
//  Copyright © 2017 かわゆた. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let adress:String = "http://192.168.1.23:7878"
    
    @IBOutlet weak var input_Value: UITextField!
    @IBOutlet weak var input_Value2: UITextField!
    @IBOutlet weak var notice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.input_Value.placeholder = "キーワード1を入力してください"
        self.input_Value2.placeholder = "キーワード2を入力してください"
        
            Alamofire.request("\(adress)/inspis/1.json").responseJSON { response in
                if let jsonDict = response.result.value as? NSDictionary {
                    let word1:String? = String(describing: String(describing: jsonDict["keyword_1"]))
                    let word2:String? = String(describing: String(describing: jsonDict["keyword_2"]))
                }
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func Post(_ sender: Any) {
        
        var parameters = [
            "keyword_1": "",
            "keyword_2": ""
            ] as [String : Any]
        
        parameters["keyword_1"] = self.input_Value.text
        parameters["keyword_2"] = self.input_Value2.text
        
        Alamofire.request("\(self.adress)/inspis.json", method: .post, parameters: ["inspi": parameters]).responseJSON {
            response in
            switch response.result {
            case .success:
                print(response)
                self.notice.text = "投稿が完了しました。"
                
                break
            case .failure(let error):
                print(error)
                self.notice.text = "投稿に失敗しました。"
            }
        }
        
    }
    

}

