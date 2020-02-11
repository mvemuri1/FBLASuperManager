//
//  EventsStudent.swift
//  FBLASuperManager
//
//  Created by Megha Vemuri on 2/10/20.
//  Copyright © 2020 Megha Vemuri. All rights reserved.
//
import UIKit
// Imports Authentication & Database management for Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import WebKit


class EventsStudent: UIViewController {
    
    
    @IBOutlet weak var eventt: WKWebView!

    //basic function to load view
    
  //  let userDefault = UserDefaults.standard
    
 /*   let db = Firestore.firestore()
    
      db.collection("chapter").addDocument(data: ["email":self.email, "password":self.password, "chapterCalendar":self.chapterCalendar, "chapterWebsite":self.chapterWebsite, "eventsForm":self.eventsForm, "eventsSheet":self.eventsSheet, "facebookLink":self.facebookLink, "instagramLink":self.instagramLink, "joinForm":self.joinForm, "schoolName":self.schoolName, "twitterLink":self.twitterLink, "uid":result!.user.uid])
 */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let cale:URL = URL(string: "https://www.fbla-pbl.org/fbla/competitive-events/")!
                // created a URL request
                let request = URLRequest(url: cale)
                // the calendar webview will load what was requested
                self.eventt.load(request)
 
         }
       
        
        
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()    }
 
    

    

    
}
