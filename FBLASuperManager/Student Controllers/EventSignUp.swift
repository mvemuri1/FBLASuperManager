//
//  EventSignUp.swift
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


class EventSignUp: UIViewController {

    var ex:ChooseSchool = ChooseSchool()
    
    @IBOutlet weak var eventt: WKWebView!

    //basic function to load view
    
  //  let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user1 = ex.user1
        
        let db = Firestore.firestore()
        
        
        // the String called cal is the link to the calendar.
        var events: String!
        
        
        
        // this pulls the data for the current user from Firestore
        let ref = db.collection("chapter").document(user1)
        
        
        
        // the following getDocument call helps to search for the field known as chapterCalendar inside the current user's data
        ref.getDocument { (snapshot, err) in
           if let data = snapshot?.data() {
            // making sure it is a string for use as a URL later. the string in the "" is the field that will be retrieved.
             events = (data["eventsForm"]) as! String
           } else {
            // to avoid crashing
             events = ("google.com")
            
           }
            
            if events != nil {
                // cal is a URL variable. trimmingcharacters was called to make sure the string can be safely used as a URL
                let cale:URL = URL(string: events.trimmingCharacters(in: .whitespacesAndNewlines))!
                // created a URL request
                let request = URLRequest(url: cale)
                // the calendar webview will load what was requested
                self.eventt.load(request) }
 
         }
       
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()    }
 
    

    

    
}

