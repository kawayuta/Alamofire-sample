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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Alamofire.request("http://192.168.122.143:3000/babies/1.json").responseJSON { response in
            print(response.request ?? "ee")  // original URL request
            print(response.response ?? "ee") // HTTP URL response
            print(response.data ?? "ee")     // server data
            print(response.result)   // result of response serialization
            let jsonDict = response.result.value as! NSDictionary
            
            print(jsonDict)
            
            let team_1 = jsonDict["team_1"] as! Int
            let team_2 = jsonDict["team_2"] as! Int
            let team_3 = jsonDict["team_3"] as! Int
            let team_4 = jsonDict["team_4"] as! Int
            
            
            print(team_1)
            print(team_2)
            print(team_3)
            print(team_4)
            
        }
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

