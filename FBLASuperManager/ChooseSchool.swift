//
//  ChooseSchool.swift
//  FBLASuperManager
//
//  Created by Megha Vemuri on 2/10/20.
//  Copyright © 2020 Megha Vemuri. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase


class ChooseSchool: UIViewController {

     @IBOutlet weak var school: UITextField!
     @IBOutlet weak var signInButton: UIButton!
    
override func viewDidLoad() {
    super.viewDidLoad()
}

    @IBAction func nextTapped(_ sender: Any) {
        let school1 = school.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        
        
        
    }
}



