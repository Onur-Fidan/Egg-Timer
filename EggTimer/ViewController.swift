//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var prograssBar: UIProgressView!
    
    let eggTimes = ["Soft": 300, "Medium": 400, "Hard": 700]
    var timer = Timer()
    var totalTime = 0
    var secondPassed = 0
    var player: AVAudioPlayer!

    @IBAction func hardnessSelected(_ sender: UIButton) {

        timer.invalidate()
        let hardness = sender.currentTitle! //Soft, Medium, Hard
        totalTime = eggTimes[hardness]!
        
        prograssBar.progress = 0.0
        secondPassed = 0
        titleLabel.text = hardness
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
    }
    
    @objc func timerAction(){
        if secondPassed < totalTime{
            secondPassed += 1
            prograssBar.progress = Float(secondPassed) / Float(totalTime)
            
        }
        else{
            timer.invalidate()
            titleLabel.text = "DONE"
            playSound()
        }
    }
    
    
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound" , withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    
    
    
    
    
}





