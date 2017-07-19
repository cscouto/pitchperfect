//
//  OptionVC.swift
//  PitchPerfect
//
//  Created by Tiago henrique on 1/25/17.
//  Copyright © 2017 Tiago Henrique. All rights reserved.
//

import UIKit
import AVFoundation

class OptionVC: UIViewController {
    
    var url: URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, vader, chipmunk, reverb,  echo
    }

    @IBOutlet weak var slow: UIButton!
    @IBOutlet weak var fast: UIButton!
    @IBOutlet weak var low: UIButton!
    @IBOutlet weak var high: UIButton!
    @IBOutlet weak var parrot: UIButton!
    @IBOutlet weak var echo: UIButton!
    @IBOutlet weak var stop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    @IBAction func playSound(_ sender: UIButton){
        
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
        
    }
    
    @IBAction func stopSound(_ sender: UIButton){
        stopAudio()
    }
    

}
