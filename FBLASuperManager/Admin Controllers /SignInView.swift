//
//  SignInView.swift
//  FBLASuperManager
//
//  Created by Megha Vemuri on 2/4/20.
//  Copyright © 2020 Megha Vemuri. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase


class SignInView: UIViewController {
    //basic function to load view
// let userDefault = UserDefaults()
 //   var window: UIWindow?
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.alpha = 0
        setUpElements()
    }
    
    func setUpElements() {
        
        Utilities.styleFilledButton(signInButton)
    }
    
    override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()    }
    
    @IBAction func signInTapped(_ sender: Any) {
        // TODO: Validate Text Fields
        
        // Create cleaned versions of the text field
        let email1 = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password1 = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email1, password: password1) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 3
            }
            else {
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? Welcome
                          
                //self.view.window!.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
                       
            }
        }
    }
 /*   func transitionToWelcome() {
          let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? Welcome
           
           view.window!.rootViewController = homeViewController
           view.window?.makeKeyAndVisible()
        
        
        */
    /*   override func viewDidAppear(_ animated: Bool) {
        if userDefault.bool(forKey: "usersignedin") {
            performSegue(withIdentifier: "Segue_To_Signin", sender: self)
        }

    }
 */
  
   
        
    

}


