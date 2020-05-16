//
//  scData.swift
//  SoundcloudlooperSWIFTUI
//
//  Created by Henry on 5/1/20.
//  Copyright © 2020 Tavo. All rights reserved.
//

import SwiftUI

struct scDataID: Codable, Identifiable
{
    var id:Int
    var artwork_url:String
    var waveform_url:String

}
struct scTrack: Codable
{
    var http_mp3_128_url:String
    

}


class api
{
    
   
    
    
   
    func AudioFile(urlString:String) -> String
    {
      var streamurl:String = ""
      var id:Int = 0
      let semaphore = DispatchSemaphore(value: 0)
       let urlResolve = URL(string: "https://api.soundcloud.com/resolve?url=\(urlString)&client_id=")
              URLSession.shared.dataTask(with: urlResolve!) { (data, _, _) in
                
                let scdata = try! JSONDecoder().decode(scDataID.self, from: data!)
                
                id = scdata.id
                
               // print(" invariable id: \(id)")
                
                
                
                
                let urlTrack = URL(string: "https://api.soundcloud.com/i1/tracks/\(id)/streams?client_id=")
                            URLSession.shared.dataTask(with: urlTrack!) { (data, _, _) in

                              let scdata = try! JSONDecoder().decode(scTrack.self, from: data!)
                              //  print("StreamURL: \(scdata.http_mp3_128_url)")
                                streamurl = scdata.http_mp3_128_url
                                //print("Here lies \(streamurl)...someone")
                                semaphore.signal()

                            }.resume()
                
                
        }.resume()
        semaphore.wait()

 
        return streamurl
            
    }
    func returnArtwork(urlString:String) -> String
    {
        var artwork:String = ""
          let semaphore = DispatchSemaphore(value: 0)
              let urlResolve = URL(string: "https://api.soundcloud.com/resolve?url=\(urlString)&client_id=")
                     URLSession.shared.dataTask(with: urlResolve!) { (data, _, _) in
                       
                       let scdata = try! JSONDecoder().decode(scDataID.self, from: data!)
                       
                        artwork = scdata.artwork_url
                        semaphore.signal()
                      // print("artworkURL: \(artwork)")
        
        }.resume()
        semaphore.wait()
        return artwork

}
        func returnWaveform(urlString:String) -> String
        {
            var waveform:String = ""
              let semaphore = DispatchSemaphore(value: 0)
                  let urlResolve = URL(string: "https://api.soundcloud.com/resolve?url=\(urlString)&client_id=")
                         URLSession.shared.dataTask(with: urlResolve!) { (data, _, _) in
                           
                           let scdata = try! JSONDecoder().decode(scDataID.self, from: data!)
                           
                            waveform = scdata.waveform_url
                            semaphore.signal()
                           //print("waveformurl: \(waveform)")
            
            }.resume()
            semaphore.wait()
            return waveform

    }
}



