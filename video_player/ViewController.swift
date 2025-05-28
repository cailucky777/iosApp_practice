//
//  ViewController.swift
//  video_player
//
//  Created by Luying Cai on 5/28/25.
//

import Cocoa
import AVKit
import AVFoundation

class ViewController: NSViewController {
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let url = Bundle.main.url(forResource: "samplevideo", withExtension: "mp4") else { return }
            let player = AVPlayer(url: url)

            // 1. 创建 AVPlayerView
            let playerView = AVPlayerView(frame: view.bounds)
            playerView.autoresizingMask = [.width, .height]
            
            // 2. 赋值 player，并显示系统控制条
            playerView.player = player
        
            playerView.controlsStyle = .floating     // 也可选 .none, .minimal

            // 3. 加到窗口里
            view.addSubview(playerView)

            // 4. 播放
            player.play()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

