//
//  DataModel.swift
//  Tinder
//
//  Created by Ashish Kumar on 12/04/20.
//  Copyright © 2020 Ashish Kumar. All rights reserved.
//

import Foundation
import SwiftUI

struct DataModel : Identifiable {
    var id: String
    var name: String
    var image: String
    var age: String
    var swipe: CGFloat
    var degree: Double
}
