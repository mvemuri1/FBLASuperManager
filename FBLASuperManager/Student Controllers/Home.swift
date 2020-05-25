//
//  Home.swift
//  FBLASuperManager
//
//  Created by Megha Vemuri on 2/11/20.
//  Copyright © 2020 Megha Vemuri. All rights reserved.
//

import UIKit
import Social

class Home: UIViewController {

    @IBOutlet weak var aboutFBLA: UIButton!
    
     @IBOutlet weak var joinChap: UIButton!
    
     @IBOutlet weak var chapWeb: UIButton!
    
     @IBOutlet weak var localOff: UIButton!
    
    
    @IBOutlet weak var faceb: UIButton!
    
    
    @IBOutlet weak var insta: UIButton!
    
    @IBOutlet weak var twit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
          
 /*   @IBAction func postFaceBook(_ sender: Any) {
        // Check if Facebook is available
        if (SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook))
        {
            // Create the post
            let post = SLComposeViewController(forServiceType: (SLServiceTypeFacebook))
            post!.setInitialText("I want to share this App: ")
            post!.add(UIImage(named: "shareImage"))
            self.present(post!, animated: true, completion: nil)
        } else {
            // Facebook not available. Show a warning
            let alert = UIAlertController(title: "Facebook", message: "Facebook not available", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
 
 */
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
