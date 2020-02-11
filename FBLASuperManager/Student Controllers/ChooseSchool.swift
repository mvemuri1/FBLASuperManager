//
//  ChooseSchool.swift
//  FBLASuperManager
//
//  Created by Megha Vemuri on 2/10/20.
//  Copyright © 2020 Megha Vemuri. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore



class ChooseSchool: UIViewController {
     @IBOutlet weak var school: UITextField!
     @IBOutlet weak var signInButton: UIButton!
    
    var user1 = "2PwK42f4kWb1SRnoQpfHQmoxowR2"
    

    // the user id that we want
    
    
override func viewDidLoad() {
    super.viewDidLoad()
}

    
    @IBAction func nextTapped(_ sender: Any) {
   
        
   // the school entered by the student
        let school1 = school.text!.trimmingCharacters(in: .whitespacesAndNewlines)

        
// the school that is going to be checked against the entered school
        var school2:String!
// the array of id's
        var useruid: [String]!
        let emptyUid = ["empty", "empty"]
        
    
        let db = Firestore.firestore()
         
//get the array of user ids
        let uids = db.collection("UID").document("useruid").getDocument { (snapshot, err) in
            if let data = snapshot?.data(){
                useruid = (data["uid"]) as! [String]
            } else {
                useruid = emptyUid
            }
        }
// for loop to look through the id array
            for user in useruid {
                let newref = db.collection("chapter").document(user)
                newref.getDocument { (snapshot, err) in
                    if let data = snapshot?.data() {
                        if school1 == (data["schoolName"]) as! String {
                            self.user1 = user
                        }
                    }
                }
            }
            
        if self.user1 == nil {
            self.user1 = "Cannot be found"
            
            
        }
        
        
        
    }
}
        
        

        



