//
//  ContentView.swift
//  SoundcloudlooperSWIFTUI
//
//  Created by Henry on 5/1/20.
//  Copyright © 2020 Tavo. All rights reserved.
//

import SwiftUI
import AudioKit
import RangeSeekSlider
import struct Kingfisher.KFImage

struct ContentView: View {
    @State var repeatSwitch:Bool = false
    var playerview = PlayerView()
    var apiClass = api()

    @State private var mode = false
    @State private var urlInput:String = ""
    @State var player: AVPlayer = AVPlayer()
    @State var padplayeritem:AVPlayerItem!
    @State var playerLayer: AVPlayerLayer!
    @State private var slideBool = false
    @State private var startime:CMTime = CMTime(seconds: 0, preferredTimescale: 1)
    @State private var endtime:CMTime = CMTime(seconds: 10, preferredTimescale: 1)
    @State var rangeslider = RangeSeekSlider()
    @State var currenttime:Int = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var urlArtwork = ""
    @State var urlArtwork500:String = ""
    @State var waveformURL:String = ""
 
        var body: some View {
            Color.black.edgesIgnoringSafeArea(.vertical).overlay(
        VStack{
        
            TextField("type here", text: $urlInput){
                         UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                     }.multilineTextAlignment(.center)
            if(self.slideBool == true)
            {
                
                KFImage(URL(string: "\(urlArtwork500)")).resizable().frame(width:300,height:300)
                    ZStack
                        {
                            Color.orange.frame(width:400,height:70)
                    KFImage(URL(string: "\(waveformURL)")).resizable().frame(width:400,height:70).colorInvert()
                        }
                
                sliderRange(padplayItem: self.$padplayeritem, rangeslide: $rangeslider, player: self.$player, startime: self.$startime, endtime: self.$endtime).frame(height:100)
                
                
               
            }
            
     
        HStack
            {
              
            
                Button(action: {
                    if(self.mode == false)
                    {
                        self.startime = CMTime(seconds: Double(self.rangeslider.selectedMinValue*60), preferredTimescale: 1)
                        
                        self.endtime = CMTime(seconds: Double(self.rangeslider.selectedMaxValue*60), preferredTimescale: 1)
                        
                        self.player.seek(to: self.startime)
                   
                        self.player.play()
                        
                        self.mode = true
                    }else
                    {
                        self.player.pause()
                        self.mode = false
                        self.currenttime = 0
                    }
                   
                }){
                    if(self.mode == false)
                    {
                        Image("playbutton").resizable().frame(width: 30, height: 30)
                    }else{
                        Image("pause").resizable().frame(width: 30, height: 30)
                    }
                }
           
        
    
            }
         
            
            Button(action: {
                
                self.padplayeritem = AVPlayerItem(url: URL(string: self.apiClass.AudioFile(urlString: self.urlInput))!)
                self.player = AVPlayer(playerItem: self.padplayeritem)
                self.playerLayer = AVPlayerLayer(player: self.player)
                self.playerLayer.frame = CGRect(x: 0, y: 0, width: 10, height: 50)
                self.urlArtwork = self.apiClass.returnArtwork(urlString: self.urlInput)
                self.urlArtwork500 = String(self.urlArtwork.prefix(51)) + "t500x500.jpg"
                self.waveformURL = self.apiClass.returnWaveform(urlString: self.urlInput)
              
                self.slideBool = true
              // print("artwork in contentview \(self.urlArtwork)")
                
            }){
                Image("launchpad").resizable().frame(width:50,height:50)
            }
            
          
            Text("").onReceive(timer){_ in
                if(self.mode == true)
                {
                    self.currenttime = Int(CMTimeGetSeconds(self.player.currentTime())) + 1
                }
                if(self.currenttime > Int(CMTimeGetSeconds(self.endtime)))
                {
                    self.player.seek(to: self.startime)
                   // print("went over")
                }
                
            }
            

          
        })
      
        
     
    }


}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
