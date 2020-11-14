//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
import AVFoundation
import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var progressBar: UIProgressView!
    
    var sound : AVAudioPlayer?
    @IBOutlet weak var currentLabel: UILabel!
    var eggTypes = ["Soft":5 ,"Hard" : 10 , "Medium" : 15 ]
    var timer: Timer?
    var totalTime = 0.0
    var currentTime : Double?
    
    
    @IBAction func eggBtnClicked(_ sender: UIButton)
    {
        timer?.invalidate()
        currentLabel.text = "Counting......"
        currentTime = 0.0
        progressBar.progress = Float(currentTime!)
        let egg = sender.currentTitle!
        let result = Double(eggTypes[egg]!)
        totalTime = result
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0 , target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func fireTimer()
    {
        progressBar.progress = Float(Double(currentTime!) / Double(totalTime))
        
        
        print(currentTime!)
        
        
        if currentTime == totalTime
        {
            timer?.invalidate()
            currentLabel.text = "Done"
            playAlarmSound()
           
            
        }
        currentTime! += 1.0
        
    }
    
    func playAlarmSound()
    {
        let path = Bundle.main.path(forResource: "alarm_sound.mp3", ofType:nil)!
        
        let url = URL(fileURLWithPath: path)

        do {
            sound = try AVAudioPlayer(contentsOf: url)
            sound!.play()
        } catch {
            print("couldn't pay sound")
        }
        
        
    }
    
    
}
