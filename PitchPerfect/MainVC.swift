//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Tiago Henrique on 12/18/16.
//  Copyright © 2016 Tiago Henrique. All rights reserved.
//

import UIKit
import AVFoundation

class MainVC: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet var recordingLabel: UILabel!
    @IBOutlet var recordingButton: UIButton!
    @IBOutlet var stopRecordingButton: UIButton!
    
    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.isEnabled = false
        
    }
    

    @IBAction func recordAudio(_ sender: UIButton) {
        recordingLabel.text = "Recording in progress"
        stopRecordingButton.isEnabled = true
        recordingButton.isEnabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecording(_ sender: UIButton) {
        stopRecordingButton.isEnabled = false
        recordingButton.isEnabled = true
        recordingLabel.text = "Tap to Record"
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag{
            performSegue(withIdentifier: "toOption", sender: audioRecorder.url)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toOption" {
            if let destination = segue.destination as? OptionVC {
                destination.url = sender as! URL
            }
        }
    }

}

