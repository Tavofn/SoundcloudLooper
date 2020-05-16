//
//  activityIndicator.swift
//  SoundcloudlooperSWIFTUI
//
//  Created by Henry on 5/15/20.
//  Copyright © 2020 Tavo. All rights reserved.
//

import SwiftUI
import UIKit

struct activityIndicator: UIViewRepresentable {
    @Binding var animating:Bool
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .medium)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if(self.animating == false)
        {
            uiView.isHidden = true
            print("hidden")
        }else
        {
            uiView.isHidden = false
            print("not hidden")
        }
    }
}

