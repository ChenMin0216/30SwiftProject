//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by bengbengbeng on 2019/12/11.
//  Copyright © 2019 bengbengbeng. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var videoTableView: UITableView!
    
    var data = [
        Video(image: "videoScreenshot01", title: "Game Mario", source: "Youtube - 06:32"),
        Video(image: "videoScreenshot02", title: "The Facebook Wall", source: "Facebook - 10:20")
    ]
    
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        videoTableView.delegate = self
        videoTableView.dataSource = self
    }
    
}

//MARK:- UIViewTableView DataSource & Delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // as! 强制类型转换，无法转换时会抛出运行时异常
        // as？可选类型转换，无法转换时返回nil
        let cell = videoTableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        
        let video = data[indexPath.section]
        cell.videoScreenshot.image = UIImage(named: video.image)
        cell.videoTitleLab.text = video.title
        cell.videoSourceLab.text = video.source
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filePath = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        let videoUrl = URL (fileURLWithPath: filePath!)
        playerView = AVPlayer(url: videoUrl)
        playViewController.player = playerView
        
        self.present(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
    }
}

