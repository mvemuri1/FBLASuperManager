//
//  EventButtons.swift
//  FBLASuperManager
//
//  Created by Megha Vemuri on 2/10/20.
//  Copyright © 2020 Megha Vemuri. All rights reserved.
//


import UIKit

class EventButtons: UIViewController {

    
    @IBOutlet weak var info: UIButton!
    
    @IBOutlet weak var signUp: UIButton!
    
    @IBOutlet weak var sheet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
          
    func setUpElements() {
          
    // Hide the error label
          
    // Make admin button filled
        Utilities.styleFilledButton(info!)
        
    // Make student button hollow
        Utilities.styleHollowButton(signUp!)
        
        
        Utilities.styleFilledButton(sheet!)
            
    }
}
