//
//  sliderEdit.swift
//  beatmachineswiftui
//
//  Created by Henry on 4/8/20.
//  Copyright © 2020 Tavo. All rights reserved.
//

import SwiftUI
import RangeSeekSlider
import AudioKit
//THIS ONLY AFFECTS THE RANGE SLIDER, NOT THE TIME/DURATION OF AUDIO FILE
struct sliderRange: UIViewRepresentable {
    @Binding var padplayItem:AVPlayerItem!
    @Binding var rangeslide:RangeSeekSlider
    @Binding var player:AVPlayer
    @Binding var startime:CMTime
    @Binding var endtime:CMTime
    
   func makeUIView(context: Context) -> RangeSeekSlider {
          rangeslide.numberFormatter.maximumFractionDigits = 2
          rangeslide.minValue = 0
          rangeslide.maxValue = CGFloat(CMTimeGetSeconds(padplayItem.asset.duration)/60)
          rangeslide.selectedMinValue = 0
          rangeslide.selectedMaxValue =  CGFloat(CMTimeGetSeconds(padplayItem.asset.duration)/60)
          rangeslide.hideLabels = true
            return rangeslide
        
     //fdkfdfjk
    }
    
   func updateUIView(_ uiView: RangeSeekSlider, context: Context) {
   
          uiView.numberFormatter.maximumFractionDigits = 2
          uiView.minValue = 0
          uiView.maxValue = CGFloat(CMTimeGetSeconds(padplayItem.asset.duration)/60)

   // print("updated")

                
                  
        
        
    }
    
    
    
}

