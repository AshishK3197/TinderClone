//
//  LoaderView.swift
//  Tinder
//
//  Created by Ashish Kumar on 14/04/20.
//  Copyright © 2020 Ashish Kumar. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct Loader: UIViewRepresentable  {
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        return indicator
    }
}
