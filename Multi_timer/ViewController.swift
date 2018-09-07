//
//  ViewController.swift
//  Multi_timer
//
//  Created by Yuqing on 28/8/18.
//  Copyright © 2018 Yuqing. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var minutes1 = 30
    var timer1 = Timer()
    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var slideroutlet1: UISlider!
    @IBAction func slider1(_ sender: UISlider) {
        minutes1 = Int(sender.value)
        label1.text = String(minutes1) + " minutes"
    }
    
    @IBOutlet weak var startbtoutlet1: UIButton!
    @IBAction func startbt1(_ sender: Any) {
        timer1 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        slideroutlet1.isHidden = true
        startbtoutlet1.isHidden = true
    }
    
    @objc func counter()
    {
        minutes1 -= 1
        label1.text = String(minutes1) + " minutes"
        if(minutes1 == 0)
        {
            timer1.invalidate();
            audioPlayer.play()
        }
        
    }
    @IBAction func stopbt1(_ sender: Any) {
        
        timer1.invalidate()
        minutes1 = 30
        slideroutlet1.setValue(30, animated: true)
        label1.text = "30 minutes"
        slideroutlet1.isHidden = false
        startbtoutlet1.isHidden = false
        audioPlayer.stop()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do{
            let audioPath = Bundle.main.path(forResource: "alertsound1", ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        }
        catch
        {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

