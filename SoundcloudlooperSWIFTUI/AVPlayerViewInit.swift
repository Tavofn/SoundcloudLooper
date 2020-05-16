//
//  AVPlayerView.swift
//  SoundcloudlooperSWIFTUI
//
//  Created by Henry on 5/2/20.
//  Copyright © 2020 Tavo. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit
import SwiftUI
class AVPlayerViewInit: UIView {
    var player: AVPlayer!
    var streamURL:String = ""
    var playerItem: AVPlayerItem!
    var playerLayer: AVPlayerLayer!
    init() {
        super.init(frame: CGRect(width: 0, height: 0))
  }
    
  
    func initAudioPlayer(urlStream:String)
    {
        
       // print(" in av: \(urlStream)")
             playerItem = AVPlayerItem(url: URL(string: urlStream)!)
         player = AVPlayer(playerItem: playerItem)

         playerLayer = AVPlayerLayer(player: player!) //necessary to play audio (creats video player ui)

         playerLayer.frame = CGRect(x: 0, y: 0, width: 10, height: 50)
        

        
        // print("class initiated")
        
        
    }
    func updateAudioPlayer(startime:CMTime, endtime:CMTime)
    {
        player.seek(to: startime)
        
        if(player.currentTime() == endtime)
        {
            
            
        }
    }
    func play()
    {
        player.play()
    }
func stop()
    {
        player.pause()
    }
    required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
    
    


}



