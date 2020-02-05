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
import GoogleSignIn
// import PopupDialog


class SignInView: UIViewController, GIDSignInDelegate {
    //basic function to load view
 let userDefault = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // shows Google Sign In button
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if userDefault.bool(forKey: "usersignedin") {
            performSegue(withIdentifier: "Segue_To_Signin", sender: self)
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()    }
    //sets up local variables
    
    
    //login if authenticated from firebase, otherwise displays error message NIL ENTRY PREVENTION included
    @IBAction func login(_ sender: UIButton) {
        // makes log in button only google
        GIDSignIn.sharedInstance().signIn()
    }
        
    
    // signs in from Google Sign In
        func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
          // ...
          if let error = error {
            print(error.localizedDescription)
            return
          }
            // checks to see if user is in our database
          guard let authentication = user.authentication else { return }
          let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                            accessToken: authentication.accessToken)
          // ...
            
            Auth.auth().signIn(with: credential) { (authResult, error) in
              if let error = error {
                print(error.localizedDescription)
                } else {
                print("Login Successful.")
              }
              // User is signed in
              // ...
            }
            
        }
        
    
        
    

        func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
            // Perform any operations when the user disconnects from app here.
            // ...
            
        }
        
        
        
    

}

