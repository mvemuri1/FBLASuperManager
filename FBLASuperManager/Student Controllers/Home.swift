//
//  Home.swift
//  FBLASuperManager
//
//  Created by Megha Vemuri on 2/11/20.
//  Copyright © 2020 Megha Vemuri. All rights reserved.
//

import UIKit

class Home: UIViewController {

    @IBOutlet weak var aboutFBLA: UIButton!
    
     @IBOutlet weak var joinChap: UIButton!
    
     @IBOutlet weak var chapWeb: UIButton!
    
     @IBOutlet weak var localOff: UIButton!
    
     @IBOutlet weak var facebook: UIImageView!
    @IBOutlet weak var facebookk: UIButton!
    
     @IBOutlet weak var instagram: UIImageView!
    @IBOutlet weak var instagramm: UIImageView!
    
     @IBOutlet weak var twitter: UIImageView!
    
    @IBOutlet weak var twitterr: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
          
    func setUpElements() {
          
    // Hide the error label
          
    // Make admin button filled
 //       Utilities.styleFilledButton(info!)
        
    // Make student button hollow
        Utilities.styleHollowButton(aboutFBLA!)
        
        Utilities.styleHollowButton(chapWeb!)
        
        Utilities.styleFilledButton(joinChap!)
        
        Utilities.styleFilledButton(localOff!)
            
    }
}
