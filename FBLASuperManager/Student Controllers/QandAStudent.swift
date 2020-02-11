//
//  QandAStudent.swift
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

class QandAStudent: UIViewController {

    
    @IBOutlet weak var contactUs: UILabel!
    
    var email: String = ""
    
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
        
        
        //sets label text
        contactUs.text = "Still have more questions? Contact Us via email \(email)"
        contactUs.text = "Still have more questions? Contact Us via email alpharettafbla@gmail.com"
    }
}
