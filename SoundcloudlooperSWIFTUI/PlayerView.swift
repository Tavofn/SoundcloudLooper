//
//  audioPlayerAV.swift
//  SoundcloudlooperSWIFTUI
//
//  Created by Henry on 5/2/20.
//  Copyright © 2020 Tavo. All rights reserved.
//

import SwiftUI
import AVFoundation
struct PlayerView: UIViewRepresentable {
  var avplayerinit = AVPlayerViewInit()
    func makeUIView(context: Context) -> UIView {
       // print("happened")
        return avplayerinit
        
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    func play()
    {
        avplayerinit.play()
    }
    func stop()
    {
        avplayerinit.stop()
    }
}

