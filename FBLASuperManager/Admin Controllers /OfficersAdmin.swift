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

    
    public var printName: [String] = []
    public var printBio: [String] = []
    
    //Creates reference to UI
    @IBOutlet weak var n: UITextField!
    
    @IBOutlet weak var b: UITextField!
    
    
    @IBOutlet weak var list: UITextView!
    
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
        
        print(printOfficers())
        list.text = printOfficers()
        
        
       
        
    }
    
    //returns String full of QA
       func printOfficers() -> String{
          let db = Firestore.firestore()
           let chapRef = db.collection("chapter").document(Auth.auth().currentUser!.uid)
           var printedString = ""
              
              chapRef.getDocument { (snapshot, err) in
                        if let data = snapshot?.data() {
                         // making sure it is a string for use as a URL later. the string in the "" is the field that will be retrieved.
                          if((data["name"]) != nil){
                           self.printName = data["name"] as! [String]
                          }
                          if((data["bio"]) != nil){
                              self.printBio = data["bio"] as! [String]
                          }
                  }}
           
           //fills in printedString
        
        var i = 0
        for name in printName{
                       printedString = "\(printedString) Name: \(name) \nBio: \(printBio[i]) \n\n"
            i = i+1
               }
        print(printedString)
           return printedString
       }
    
    
    
    
          
   

}
