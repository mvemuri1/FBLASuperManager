//
//  QandAAdmin.swift
//
//
//  Created by Annie Seth on 2/9/20.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import Firebase

class OfficersAdmin: UIViewController {

    //Instantiates 2 global arrays for Q and A
    public var name: [String] = []
    public var bio: [String] = []

    //Creates reference to UI
    @IBOutlet weak var n: UITextField!
    
    @IBOutlet weak var b: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //Adds new question and answer to array
    @IBAction func submitInfoTapped(_ sender: Any) {
    
        
        //overrides question and answer field in database
        let db = Firestore.firestore()
               
               
               // the String called cal is the link to the calendar.
               
               
               
               // this pulls the data for the current user from Firestore
               let ref = db.collection("chapter").document(Auth.auth().currentUser!.uid)
               
               
          
        
        ref.updateData(["name": FieldValue.arrayUnion([n.text!])])
        ref.updateData(["bio": FieldValue.arrayUnion([b.text!])])
        
        
        //empty textfields
        n.text = ""
        b.text = ""
        
    }
    
    
    
    
          
   

}
