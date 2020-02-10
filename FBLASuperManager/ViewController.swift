//
//  ViewController.swift
//  FBLASuperManager
//
//  Created by Megha Vemuri on 2/3/20.
//  Copyright © 2020 Megha Vemuri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var admin: UIButton!
    
    @IBOutlet weak var student: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
          
    func setUpElements() {
          
    // Hide the error label
          
    // Make admin button filled
        Utilities.styleFilledButton(admin!)
        
    // Make student button hollow
        Utilities.styleHollowButton(student!)
            
    }
}

