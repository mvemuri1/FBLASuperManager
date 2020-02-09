//
//  Welcome.swift
//  FBLASuperManager
//
//  Created by Megha Vemuri on 2/4/20.
//  Copyright © 2020 Megha Vemuri. All rights reserved.
//

import Foundation
import UIKit
// Imports Authentication & Database management for Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import WebKit


class Welcome: UIViewController {
    
    @IBOutlet weak var calendar: WKWebView!
    
    
   
    //basic function to load view
    
  //  let userDefault = UserDefaults.standard
    
 /*   let db = Firestore.firestore()
    
      db.collection("chapter").addDocument(data: ["email":self.email, "password":self.password, "chapterCalendar":self.chapterCalendar, "chapterWebsite":self.chapterWebsite, "eventsForm":self.eventsForm, "eventsSheet":self.eventsSheet, "facebookLink":self.facebookLink, "instagramLink":self.instagramLink, "joinForm":self.joinForm, "schoolName":self.schoolName, "twitterLink":self.twitterLink, "uid":result!.user.uid])
 */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let db = Firestore.firestore()
        
        var cal: String!

      let ref = db.collection("chapter").document("mt8kgPGsCmVhNtd3L8us")
       ref.getDocument { (snapshot, err) in
           if let data = snapshot?.data() {
           cal = (data["chapterCalendar"]) as! String
           } else {
            print("google.com")
           }
       }
        
        if cal != nil {
            let url = URL(string: cal!)
        
        let request = URLRequest (url: url!)
        
            calendar.load(request) }
            
    /*    } else {
            let url = URL(string: "https://meg551.wixsite.com/mysite")
            
            let request = URLRequest (url:url!)
            
            calendar.load(request)
        } */
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()    }
 
    

    

    
}

