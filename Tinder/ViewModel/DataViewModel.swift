//
//  DataViewModel.swift
//  Tinder
//
//  Created by Ashish Kumar on 12/04/20.
//  Copyright © 2020 Ashish Kumar. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage

class DataViewModel : ObservableObject{
    
    @Published var users = [DataModel]()
    @Published var last = -1
    
    init() {
        let db = Firestore.firestore()
        db.collection("users").getDocuments { (snapshot, error) in
            if let err = error{
                print("There was an error retrieving data from Firestore.\(err)")
            }else{
                let documentSnapShot = snapshot?.documents
                
                for doc in documentSnapShot!{
                    
                    let name = doc.get("name") as! String
                    let age = doc.get("age") as! String
                    let image = doc.get("image") as! String
                    let id = doc.documentID
                    let status = doc.get("status") as! String
                    
                    
                    if status == ""{
                    self.users.append(DataModel(id: id, name: name, image: image, age: age, swipe: 0, degree: 0))
                    }
                }
            }
            
            
        }
    }
    
    func update(id: DataModel, value: CGFloat , degree: Double){
        for i in 0..<self.users.count{
            if self.users[i].id == id.id{
                self.users[i].swipe = value
                self.users[i].degree = degree
                self.last = i
            }
        }
    }
    
    func updateDB(id: DataModel , status: String){
        
        let db = Firestore.firestore()
        db.collection("users").document(id.id).updateData(["status": status]) { (error) in
            if error != nil{
                print(error!)
                return
            }
            print("success")
            for i in 0..<self.users.count{
                if self.users[i].id == id.id{
                    if status == "liked"{
                        self.users[i].swipe = 500
                    }else if status == "rejected"{
                        self.users[i].swipe = -500
                    }else{
                        self.users[i].swipe = 0
                    }
                }
            }
        }
    }
    
}


// TO GET IMAGE URL FROM FIREBASE STORAGE
//        let storage = Storage.storage()
//        let pathReference = storage.reference(withPath: "TinderSnaps/1.jpg")
//        pathReference.downloadURL { (url, error) in
//            if let error = error{
//                print("error fetching url\(error)")
//            }else{
//                print(url!)
//            }
//        }
