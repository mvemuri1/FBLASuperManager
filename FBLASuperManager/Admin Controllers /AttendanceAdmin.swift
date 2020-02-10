//
//  AttendanceAdmin.swift
//  FBLASuperManager
//
//  Created by Annie Seth on 2/9/20.
//  Copyright © 2020 Megha Vemuri. All rights reserved.
//

import UIKit

class AttendanceAdmin: UIViewController {

    //Creates reference for UI
    
    @IBOutlet weak var dateChosen: UIDatePicker!
    
    @IBOutlet weak var attendee: UITextField!
    
    //Instantiate an array for each date
    public var dates: [String] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
    //Action of saving the attendance
    @IBAction func presentTapped(_ sender: Any) {
        
        let formatter = DateFormatter()
        
        dates.append(formatter.string(from: dateChosen.date))
    }
    
   
}
