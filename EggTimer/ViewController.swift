//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    let eggTime = ["Soft": 3 , "Medium": 4 , "Hard": 7]
    var timer = Timer()
    var secondPassed = 0
    var totalTime = 0
    

    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @IBAction func btnHardnessClicked(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        progressBar.progress = 0.0
        secondPassed = 0
        lblTitle.text = hardness
        totalTime = eggTime[hardness]!
       timer =  Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer()
    {
        
        progressBar.progress = Float(secondPassed) / Float(totalTime)
        if secondPassed < totalTime {
            print("\(secondPassed) seconds.")
            secondPassed += 1
        }
        else
        {
            timer.invalidate()
            lblTitle.text = "DONE!"
            progressBar.progress = 1

            
        }
    }
    
    
    
}
        
  
