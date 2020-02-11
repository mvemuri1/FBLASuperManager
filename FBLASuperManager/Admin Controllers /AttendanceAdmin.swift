//
//  AttendanceAdmin.swift
//  FBLASuperManager
//
//  Created by Annie Seth on 2/9/20.
//  Copyright © 2020 Megha Vemuri. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import Firebase

class AttendanceAdmin: UIViewController {

    //Creates reference for UI
    
    @IBOutlet weak var dateChosen: UIDatePicker!
    
    @IBOutlet weak var attendee: UITextField!
    
    //Instantiate an array for each date
    public var dates: [String] = []
    
    //eventuall retrives and stores OLD data from database before updating
    var attendees: [String] = []
    
    var attendeeDates: [String] = []
    var attendeeRef: [String] = []
    
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
   }
    
    
    //Action of saving the attendance
   @IBAction func presentTapped(_ sender: Any) {
    
   //ADD ERROR IF NO NAME WAS ENTERED
        
    var check: Bool = false
    var index: Int = -1
    let formatter = DateFormatter()
    let db = Firestore.firestore()
    let dateStr = (formatter.string(from: dateChosen.date))
    
    attendees.append(attendee.text!)
    dates.append(dateStr)
    
     let chapRef = db.collection("chapter").document(Auth.auth().currentUser!.uid)
    
    
    
    chapRef.getDocument { (snapshot, err) in
              if let data = snapshot?.data() {
               // making sure it is a string for use as a URL later. the string in the "" is the field that will be retrieved.
                self.attendeeDates = [(data["attendeeDates"]) as! String]
                self.attendeeRef = [(data["attendeeRef"]) as! String]

        }}
               
            
    
        //if the date has been entered previously
    for date in attendeeDates{
        if (date == (dateStr)){
            index = dates.firstIndex(of:dateStr)!
            check = true
            }
    }
    
    
    // if date has not been entered previously
    if (check == false){
        var attendeeRefPage: DocumentReference? = nil

        // Add a new document with a generated id.
        
        attendeeRefPage = db.collection("chapterAttendance").addDocument(data: [
            "attendees": self.attendees,
            "date": dateStr
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(attendeeRefPage!.documentID)")
            }
        }
                            
               chapRef.updateData(["attendeeDate": FieldValue.arrayUnion([dateStr])])
                chapRef.updateData(["attendeeRef": FieldValue.arrayUnion([attendeeRefPage!])])

    }
        
    //if date exists in array 
    else {
        let attendeeDocRef = attendeeRef[index]
        
        let chapAttendeeRef = db.collection("chapterAttendance").document(attendeeDocRef)
        
        chapAttendeeRef.updateData(["attendees": FieldValue.arrayUnion([attendee.text!])])

        
        
    }
        
        //adding new date to dates array
        dates.append((formatter.string(from: dateChosen.date)))
    
        index = dates.firstIndex(of:(formatter.string(from: dateChosen.date)))!
        
    }
    
    
    //seek reference
    
    //combines this with the existing attendance array
    
           
           
           
           
    
   
    }
    
   

