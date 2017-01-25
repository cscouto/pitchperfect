//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Tiago Henrique on 12/18/16.
//  Copyright © 2016 Tiago Henrique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var recordingLabel: UILabel!
    @IBOutlet var recordingButton: UIButton!
    @IBOutlet var stopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func recordAudio(_ sender: UIButton) {
        recordingLabel.text = "Recording in Progress"
        stopRecordingButton.isEnabled = true
        recordingButton.isEnabled = false
    }
    @IBAction func stopRecording(_ sender: UIButton) {
        stopRecordingButton.isEnabled = false
        recordingButton.isEnabled = true
        recordingLabel.text = "Tap to Record"
    }

}

