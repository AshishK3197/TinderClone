//
//  SwipeDetailsView.swift
//  Tinder
//
//  Created by Ashish Kumar on 14/04/20.
//  Copyright © 2020 Ashish Kumar. All rights reserved.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI


struct SwipeDetailsView: View {
    
    var name = String()
    var age = String()
    var image = String()
    var height : CGFloat = 0
    
    var body: some View {
        ZStack{
            AnimatedImage(url: URL(string: image)).resizable().cornerRadius(20).padding(.horizontal, 15).shadow(radius: 20)
            
            VStack{
                Spacer()
                HStack{
                    VStack(alignment: .leading, content: {
                        Text(name).font(.system(size: 25)).fontWeight(.heavy).foregroundColor(.white)
                        Text(age).foregroundColor(.white)
                    })
                    Spacer()
                }
            }.padding([.leading,.bottom],35)
        }.frame(height: height)
    }
}

struct SwipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeDetailsView()
    }
}
