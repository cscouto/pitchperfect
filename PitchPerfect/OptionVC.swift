//
//  OptionVC.swift
//  PitchPerfect
//
//  Created by Tiago henrique on 1/25/17.
//  Copyright © 2017 Tiago Henrique. All rights reserved.
//

import UIKit

class OptionVC: UIViewController {
    
    var url: URL!

    @IBOutlet weak var slow: UIButton!
    @IBOutlet weak var fast: UIButton!
    @IBOutlet weak var low: UIButton!
    @IBOutlet weak var high: UIButton!
    @IBOutlet weak var parrot: UIButton!
    @IBOutlet weak var echo: UIButton!
    @IBOutlet weak var stop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func playSound(_ sender: UIButton){
        
    }
    
    @IBAction func stopSound(_ sender: UIButton){
        
    }
    

}
