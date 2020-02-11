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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // leads user to the official fbla website for competitive events
        let cale:URL = URL(string: "https://www.fbla-pbl.org/fbla/competitive-events/")!
                // created a URL request
                let request = URLRequest(url: cale)
                // the event webview will load what was requested
                self.eventt.load(request)
 
         }
       
        
        
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()    }
 
    

    

    
}
