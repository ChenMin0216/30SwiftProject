//
//  ViewController.swift
//  SimpleStopWatch
//
//  Created by bengbengbeng on 2019/12/10.
//  Copyright © 2019 bengbengbeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var timeLab: UILabel!
    
    var counter: Float = 0.0 {
        didSet {
            timeLab.text = String(format: "%.1f", counter)
        }
    }
    
    var timer: Timer? = Timer()
    var isPlaying = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counter = 0.0
    }
    
    @IBAction func playBtnClick(_ sender: UIButton) {
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        // 开始计时
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func pauseBtnClick(_ sender: UIButton) {
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        if let timerTemp = timer {
            timerTemp.invalidate()
        }
        timer = nil
        isPlaying = false
    }
    
    @IBAction func resetBtnClick(_ sender: UIButton) {
        if let timerTemp = timer {
            timerTemp.invalidate()
        }
        
        timer = nil
        isPlaying = false
        counter = 0.0
        timeLab.text = String(format: "%.1f", counter)
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
    }
    
    @objc func updateTimer() {
        counter = counter + 0.1
    }
}

