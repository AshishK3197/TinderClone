//
//  ContentView.swift
//  Tinder
//
//  Created by Ashish Kumar on 12/04/20.
//  Copyright © 2020 Ashish Kumar. All rights reserved.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct ContentView: View {
    @EnvironmentObject var dataViewModel : DataViewModel
    
    var body: some View {
        
        ZStack{
            Color("LightWhite").edgesIgnoringSafeArea(.all)
            
            if dataViewModel.users.isEmpty{
                Loader()
            }
            
            VStack{
                TopView()
                
                SwipeView()
                
                BottomView()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


