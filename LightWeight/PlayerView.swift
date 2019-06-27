//
//  PlayerView.swift
//  LightWeight
//
//  Created by DOMINICO1 on 26/06/2019.
//  Copyright © 2019 DOMINICO1. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerView: UIView {
    
    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    var player: AVPlayer? {
        get {
            return playerLayer.player
        }
        set {
            playerLayer.player = newValue
        }
    }
    
    override static var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
    
    func play(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        player = AVPlayer(url: url)
        player?.play()
    }
}
