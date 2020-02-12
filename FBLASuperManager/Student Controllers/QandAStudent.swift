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
    
    @IBOutlet weak var list: UITextView!
    
    var email: String = ""
    
    var printedStr = ""
    var printQuestion: [String] = []
    var printAnswer: [String] = []
    var printedString = ""
    
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
       var i = 0
       for question in printQuestion{
                      printedString = "\(printedString) Question: \(question) \nAnswer: \(printAnswer[i]) \n\n"
           i = i+1
              }
        list.text = (printedString)
        
        list.text = "Question: How many events can I compete in at region and state? \nAnswer: You can compete in 2 events at the regional level; only one may be a presentation at the region level. At state, you can compete in a total of 2 events, including the events that you passed from region to state in. \n\n Question: How do I become an officer? \nAnswer: Come speak to the advisor, Mr. Hatcher, in his room, 1271. Applications come out in late April. \n\n Question: How much does it cost to join? \nAnswer: Joining costs $35 if you would like a t-shirt and $30 without."

    }
}
