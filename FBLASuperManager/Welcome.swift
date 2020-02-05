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
import GoogleSignIn


class Welcome: UIViewController {
    //basic function to load view
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = Auth.auth().currentUser
        if user?.uid == nil {
        //Show Login Screen
        } else {
        //Show content
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()    }
    
    
}
