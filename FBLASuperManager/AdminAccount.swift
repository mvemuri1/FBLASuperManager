//
//  AdminAccount.swift
//  FBLASuperManager
//
//  Created by Megha Vemuri on 2/9/20.
//  Copyright © 2020 Megha Vemuri. All rights reserved.
//

import UIKit

class AdminAccount: UIViewController {

    
    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var register: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
          
    func setUpElements() {
          
   
          
   //  Make sign in button filled
   Utilities.styleFilledButton(signIn)
        
    // Make register button hollow
   Utilities.styleHollowButton(register)
            
    }
}

