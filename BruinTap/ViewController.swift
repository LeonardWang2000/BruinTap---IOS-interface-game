//
//  ViewController.swift
//  BruinTap
//
//  Created by Leonard Wang on 1/16/19.
//  Copyright © 2019 Leonard Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //variables to keep track of
    var score = 0
    var timer: Timer!
    var time: Double = 15
    
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBAction func tappedStartButton(_ sender: Any) {
        score = 0
        time = 10
        
        scoreLabel.text = String(score)
        timerLabel.text = String(format: "%.2f", time)
        
        timer = Timer.scheduledTimer(timeInterval: 0.01,
                                     target: self,
                                     selector: #selector(timerAction),
                                     userInfo: nil,
                                     repeats: true)
        
        startButton.isEnabled = false
        tapButton.isEnabled = true
    }
    
    @IBAction func tappedTapButton(_ sender: Any) {
        score += 1
        scoreLabel.text = String(score)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tapButton.isEnabled = false
    }
    
    @objc func timerAction(){
        time -= 0.01
        timerLabel.text = String(format: "%.2f", time)
        
        if time <= 0 {
            
            timer.invalidate()
            timerLabel.text = "0.00"
            
            startButton.isEnabled = true
            tapButton.isEnabled = false
            
        }
    }

}

