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

class InspisShowController: UIViewController {
    
    @IBOutlet weak var result_keyword_1: UILabel!
    @IBOutlet weak var result_keyword_2: UILabel!
    var parameters: [String : Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.result_keyword_1.text = parameters["keyword_1"] as? String
        self.result_keyword_2.text = parameters["keyword_2"] as? String
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print(parameters)
    }
    
    
}


