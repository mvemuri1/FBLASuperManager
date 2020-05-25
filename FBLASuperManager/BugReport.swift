//
//  BugReport.swift
//  FBLASuperManager
//
//  Created by Megha Vemuri on 5/25/20.
//  Copyright © 2020 Megha Vemuri. All rights reserved.
//

import Foundation
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import Firebase

class BugReport: UIViewController {

    //Instantiates 2 global arrays for Q and A
   
  //  @IBOutlet weak var reported: UITextField!
    @IBOutlet weak var message: UITextView!
    
    @IBOutlet weak var submit: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func submitTapped(_ sender: Any) {
        
        message.text = "Thank you! The SuperDevelopers will fix this immediately."
      //  reported.placeholder = ""
    }
    
}
    
