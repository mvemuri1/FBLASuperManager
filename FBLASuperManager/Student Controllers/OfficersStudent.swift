//
//  OfficersStudent.swift
//  FBLASuperManager
//
//  Created by Annie Seth on 2/11/20.
//  Copyright © 2020 Megha Vemuri. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import Firebase

class OfficersStudent: UIViewController {

    
    @IBOutlet weak var list: UITextView!
    
    var email: String = ""
    var printedString = ""
    var printName: [String] = []
    var printBio: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let db = Firestore.firestore()
        let chapRef = db.collection("chapter").document(Auth.auth().currentUser!.uid)
    
        chapRef.getDocument { (snapshot, err) in
                  if let data = snapshot?.data() {
                   // making sure it is a string for use as a URL later. the string in the "" is the field that will be retrieved.
                    if((data["email"]) != nil){
                        self.email = data["email"] as! String
                    }
                    
            }}
        
        
        var i = 0
               for name in printName{
                              printedString = "\(printedString) Name: \(name) \nBio: \(printBio[i]) \n\n"
                   i = i+1
                      }
               print(printedString)
        list.text =  "Name: Sarang Pujari \nBio: Co-president, 12th \n\nName: Suchetas Bokil \nBio: Co-president, 12th "
        
        
    
    }
}

