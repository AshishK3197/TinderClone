//
//  TopView.swift
//  Tinder
//
//  Created by Ashish Kumar on 12/04/20.
//  Copyright © 2020 Ashish Kumar. All rights reserved.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        HStack{
            Button(action: {
                
            }) {
                Image("person").resizable().frame(width: 35, height: 35)
            }.foregroundColor(.gray)
            
            Spacer()
            
            Button(action: {
                
            }) {
                Image(systemName: "flame.fill").resizable().frame(width: 30, height: 35)
            }.foregroundColor(.red )
            
            Spacer()
            
            Button(action: {
                
            }) {
                Image("chat").resizable().frame(width: 35, height: 35)
            }.foregroundColor(.gray)
            
        }.padding()
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
