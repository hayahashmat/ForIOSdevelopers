//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Nano Degree on 27/02/2017.
//  Copyright © 2017 Nano Degree. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController,AVAudioRecorderDelegate {

    var audioRecorder:AVAudioRecorder!
    
    
    @IBOutlet weak var record: UIButton!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var stop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stop.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rcrdbtnpress(_ sender: UIButton) {
        
        label.text = "Recording"
        record.isEnabled = false
        stop.isEnabled = true
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true) [0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        print(filePath)
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        
    }

    @IBAction func stopbtnpress(_ sender: AnyObject) {
        record.isEnabled = true
        label.text = "Tap to Record"
        
        performSegue(withIdentifier: "pitch", sender: audioRecorder.url)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
    
   }

