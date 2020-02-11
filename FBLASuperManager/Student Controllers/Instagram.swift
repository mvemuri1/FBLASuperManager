//
//  Instagram.swift
//  FBLASuperManager
//
//  Created by Megha Vemuri on 2/11/20.
//  Copyright © 2020 Megha Vemuri. All rights reserved.
//
import UIKit
// Imports Authentication & Database management for Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import WebKit


class Instagram: UIViewController {
    var ex:ChooseSchool = ChooseSchool()
    
   @IBOutlet weak var insta: WKWebView!
    
    
   
  
    override func viewDidLoad() {
        super.viewDidLoad()
         let user1 = ex.user1
        
        let db = Firestore.firestore()
        
        
        // the String called cal is the link to the instagram.
        var cal: String!
        
        
        
        // this pulls the data for the current user from Firestore
        let ref = db.collection("chapter").document(user1)
        
    
        
        // the following getDocument call helps to search for the field known as chapterCalendar inside the current user's data
        ref.getDocument { (snapshot, err) in
           if let data = snapshot?.data() {
            // making sure it is a string for use as a URL later. the string in the "" is the field that will be retrieved.
             cal = (data["joinForm"]) as! String
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
                self.insta.load(request) }
 
         }
       
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()    }
 
    

    

    
}
