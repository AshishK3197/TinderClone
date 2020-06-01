//
//  SwipeView.swift
//  Tinder
//
//  Created by Ashish Kumar on 12/04/20.
//  Copyright © 2020 Ashish Kumar. All rights reserved.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct SwipeView: View {
    
    @EnvironmentObject var dataViewModel : DataViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                ForEach(self.dataViewModel.users) { item in
                    SwipeDetailsView(name: item.name, age: item.age, image: item.image, height: geometry.size.height - 100).gesture(DragGesture()
                    
                        .onChanged({ (value) in
                            if value.translation.width > 0{
                                self.dataViewModel.update(id: item, value: value.translation.width, degree: 8)
                            }else{
                                self.dataViewModel.update(id: item, value: value.translation.width, degree: -8)
                            }
                        }).onEnded({ (value) in
                            if item.swipe > 0{
                                if item.swipe > geometry.size.width / 2 - 80{
                                    //liked
                                    self.dataViewModel.update(id: item, value: 500, degree: 0)
                                    self.dataViewModel.updateDB(id: item, status: "liked")
                                }else{
                                    self.dataViewModel.update(id: item, value: 0, degree: 0)
                                }
                            }else{
                                if -item.swipe > geometry.size.width / 2 - 80{
                                    //rejected
                                    self.dataViewModel.update(id: item, value: -500, degree: 0)
                                    self.dataViewModel.updateDB(id: item, status: "rejected ")
                                }else{
                                    self.dataViewModel.update(id: item, value: 0, degree: 0)
                                }

                            }
                        })
                    ).offset(x: item.swipe)
                        .rotationEffect(.init(degrees: item.degree))
                        .animation(.spring())
                    
        
                    
                }
            }
        }
    }
}

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
