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

    @IBOutlet weak var bug: UIButton!
    
    public var printQuestions: [String] = []
    public var printAnswers: [String] = []

    //Creates reference to UI
    @IBOutlet weak var q: UITextField!
    @IBOutlet weak var a: UITextField!
    
    //has

    
    @IBOutlet weak var list: UITextView!
    
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
        
        print(printQA())
        list.text = printQA()
    }
    
    
    
    //returns String full of QA
    func printQA() -> String{
       let db = Firestore.firestore()
        let chapRef = db.collection("chapter").document(Auth.auth().currentUser!.uid)
        var printedString = ""
           
           chapRef.getDocument { (snapshot, err) in
                     if let data = snapshot?.data() {
                      // making sure it is a string for use as a URL later. the string in the "" is the field that will be retrieved.
                       if((data["questions"]) != nil){
                        self.printQuestions = data["questions"] as! [String]
                       }
                       if((data["answers"]) != nil){
                           self.printAnswers = data["answers"] as! [String]
                       }
               }}
        
        //fills in printedString
        /*for question in printQuestions{
           
                index = printQuestions.firstIndex(of:question)!
                printedString = "\(printedString) Question: \(printQuestions[index]) \n Answer: \(printAnswers[index])"
        }*/
        var i = 0
        for question in printQuestions{
                       printedString = "\(printedString) Question: \(question) \nAnswer: \(printAnswers[i]) \n\n"
            i = i+1
               }
        
        print(printedString)
        return printedString
    }
    
    
    
    
          
   

}
