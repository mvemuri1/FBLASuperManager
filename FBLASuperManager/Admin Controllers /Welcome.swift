//
//  Welcome.swift
//  FBLASuperManager
//
//  Created by Megha Vemuri on 2/4/20.
//  Copyright © 2020 Megha Vemuri. All rights reserved.
//

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
        
        
        // the String called cal is the link to the calendar.
        var cal: String!
        
        var ref: DocumentReference!
        
        // this pulls the data for the current user from Firestore
        if (Auth.auth().currentUser != nil) {
            ref = db.collection("chapter").document(Auth.auth().currentUser!.uid)
        }
        else {
            ref = db.collection("chapter").document("ryGqulPBt0XpGMTcojuUXMHUa093")
        }
       
        
        
        
        // the following getDocument call helps to search for the field known as chapterCalendar inside the current user's data
        ref.getDocument { (snapshot, err) in
           if let data = snapshot?.data() {
            // making sure it is a string for use as a URL later. the string in the "" is the field that will be retrieved.
             cal = (data["chapterCalendar"]) as! String
           } else {
            // to avoid crashing
             cal = ("google.com")
            
           }
            
            if cal != nil {
                // cal is a URL variable. trimmingcharacters was called to make sure the string can be safely used as a URL
                let cale:URL = URL(string: cal.trimmingCharacters(in: .whitespacesAndNewlines))!
                // created a URL request
                let request = URLRequest(url: cale)
                // the calendar webview will load what was requested
                self.calendar.load(request) }
 
         }
       
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()    }
 
    

    

    
}

