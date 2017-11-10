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
    
    let adress:String = "http://192.168.1.23:7878"
    var params: [String : AnyObject] = [:]
    
    @IBOutlet weak var input_Value: UITextField!
    @IBOutlet weak var input_Value2: UITextField!
    @IBOutlet weak var notice: UILabel!
    
    @IBOutlet weak var result_Value: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if(view.restorationIdentifier == "new") {
            self.input_Value.placeholder = "キーワード1を入力してください"
            self.input_Value2.placeholder = "キーワード2を入力してください"
        } else if(view.restorationIdentifier == "result") {
            
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
                self.params = response.result.value as! Dictionary
                self.performSegue(withIdentifier: "toInspisShow", sender: nil)
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
    }
    
    
}


