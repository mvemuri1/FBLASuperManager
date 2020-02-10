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

class QandAAdmin: UIViewController {

    //Instantiates 2 global arrays for Q and A
    public var questions: [String] = []
    public var answers: [String] = []

    //Creates reference to UI
    @IBOutlet weak var q: UITextField!
    @IBOutlet weak var a: UITextField!
    
    //has
    @IBOutlet weak var list: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //Adds new question and answer to array
    @IBAction func newQATapped(_ sender: Any) {
        
        
        //overrides question and answer field in database
        let db = Firestore.firestore()
               
               
               // the String called cal is the link to the calendar.
               
               
               
               // this pulls the data for the current user from Firestore
               let ref = db.collection("chapter").document(Auth.auth().currentUser!.uid)
               
               
          
        
        ref.updateData(["questions": FieldValue.arrayUnion([q.text!])])
        ref.updateData(["answers": FieldValue.arrayUnion([a.text!])])
        
        
        //empty textfields
        q.text = ""
        a.text = ""
        
    }
    
    
    
    
          
   

}
