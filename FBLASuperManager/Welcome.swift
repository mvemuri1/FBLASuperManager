//
//  Welcome.swift
//  FBLASuperManager
//
//  Created by Megha Vemuri on 2/4/20.
//  Copyright © 2020 Megha Vemuri. All rights reserved.
//

import Foundation
import UIKit
// Imports Authentication & Database management for Firebase
import FirebaseAuth
import FirebaseDatabase
import GoogleSignIn


class Welcome: UIViewController, GIDSignInDelegate {
    
    
    //basic function to load view
    
    let userDefault = UserDefaults.standard
  
    @IBOutlet weak var emailOu: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let email = Auth.auth().currentUser?.email
            else  { return }
        emailOu.text = email
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
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
    }
        func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
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
    }
    
}
}
}
