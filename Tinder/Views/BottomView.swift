//
//  BottomView.swift
//  Tinder
//
//  Created by Ashish Kumar on 12/04/20.
//  Copyright © 2020 Ashish Kumar. All rights reserved.
//

import SwiftUI

struct BottomView: View {
    
    @EnvironmentObject var dataViewModel : DataViewModel
    var body: some View {
        HStack{
            Button(action: {
                if self.dataViewModel.last != -1{
                    self.dataViewModel.updateDB(id: self.dataViewModel.users[self.dataViewModel.last], status: "")
                }
                
            }) {
                Image("reload").resizable().frame(width: 25, height: 25).padding()
            }.foregroundColor(.yellow)
                .background(Color.white)
                .shadow(radius: 25 )
                .clipShape(Circle())
            
            Button(action: {
                
                if self.dataViewModel.last == -1{
                    //initial user
                    self.dataViewModel.updateDB(id: self.dataViewModel.users[self.dataViewModel.users.count - 1], status: "rejected")
                }else{
                    self.dataViewModel.updateDB(id: self.dataViewModel.users[self.dataViewModel.last - 1], status: "rejected")
                }
                
            }) {
                Image("clear").resizable().frame(width: 30, height: 30).padding()
            }.foregroundColor(.pink)
                .background(Color.white)
                .shadow(radius: 25 )
                .clipShape(Circle())
            
            Button(action: {
                
            }) {
                Image("star").resizable().frame(width: 25, height: 25).padding()
            }.foregroundColor(.blue)
                .background(Color.white)
                .shadow(radius: 25 )
                .clipShape(Circle())
            
            Button(action: {
                
                if self.dataViewModel.last == -1{
                    self.dataViewModel.updateDB(id: self.dataViewModel.users[self.dataViewModel.users.count - 1], status: "liked")
                }else{
                    self.dataViewModel.updateDB(id: self.dataViewModel.users[self.dataViewModel.last - 1], status: "liked")
                }
                
            }) {
                Image("heart").resizable().frame(width: 35, height: 35).padding()
            }.foregroundColor(.blue)
                .background(Color.white)
                .shadow(radius: 25 )
                .clipShape(Circle())
            
            Button(action: {
                
            }) {
                Image("current").resizable().frame(width: 35, height: 35).padding()
            }.foregroundColor(.purple)
                .background(Color.white)
                .shadow(radius: 25 )
                .clipShape(Circle())
            
        }
    }
}

struct BottomView_Previews: PreviewProvider {
    static var previews: some View {
        BottomView()
    }
}
