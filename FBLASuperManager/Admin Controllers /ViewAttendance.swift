//
//  ViewAttendance.swift
//  
//
//  Created by Annie Seth on 2/11/20.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import Firebase

class ViewAttendance: UIViewController {

    @IBOutlet weak var dateSelected: UIDatePicker!
    @IBOutlet weak var attendanceList: UITextView!
    
    var attendeeDates: [String] = []
    var attendeeRefs: [DocumentReference] = []
    var printAttendees: [String] = []
   var attendeeStr = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        }
          
    
    
    @IBAction func showAttendanceTapped(_ sender: Any) {
        attendanceList.text = ""
        attendeeStr = ""
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        let dateStr = (formatter.string(from: dateSelected.date))
        var index: Int = -1
        var check: Bool = false
        
       
        
        //------------------
        let db = Firestore.firestore()
           
           
           //local variables from screens
         //  attendees.append(attendee.text!)
          // dates.append(dateStr)
           
            let chapRef = db.collection("chapter").document(Auth.auth().currentUser!.uid)
           
           print(chapRef)
        
           
           chapRef.getDocument { (snapshot, err) in
            if let data = snapshot!.data() {
                      // making sure it is a string for use as a URL later. the string in the "" is the field that will be retrieved.
                       if((data["attendeeDates"]) != nil){
                           self.attendeeDates = data["attendeeDates"] as! [String]
                       }
                       if((data["attendeeRefs"]) != nil){
                           self.attendeeRefs = data["attendeeRefs"] as! [DocumentReference]
                       }
               }}
                      
       
           
               //if the date has been entered previously
           for date in attendeeDates{
            print("\(date) checking before")
            if (date.elementsEqual(dateStr)){
                   index = attendeeDates.firstIndex(of:dateStr)!
                   check = true
                
                
                print("\(date) checking attendees")
                   }
           }
         
        if (check) {
            print("Inside check")
            let attendeeDocRef = attendeeRefs[index]
            
            attendeeDocRef.getDocument { (snapshot, err) in
                  if let data = snapshot?.data() {
                   // making sure it is a string for use as a URL later. the string in the "" is the field that will be retrieved.
                    if((data["attendees"]) != nil){
                        self.printAttendees = data["attendees"] as! [String]
                    }
            }}
            
            print("\(printAttendees.count)")
            
            for element in printAttendees {
                attendeeStr.append("\(element) \n")
            }
            
            attendanceList.text = attendeeStr
            
            
            
        }
        else{
             attendanceList.text = "There is no attendance for \(dateStr)"
        }
        //---------------
    }
    
}
