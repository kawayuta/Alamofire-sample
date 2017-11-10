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
    var parameters: [String : Any] = [:]
    @IBOutlet weak var keyword_1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(parameters["keyword_1"] as! String)
        print(parameters["keyword_2"] as! String)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print(parameters)
    }
    
    
}


