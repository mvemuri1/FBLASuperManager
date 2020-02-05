//
//  AppDelegate.swift
//  FBLASuperManager
//
//  Created by Megha Vemuri on 2/3/20.
//  Copyright © 2020 Megha Vemuri. All rights reserved.
//

import Foundation
import UIKit
// imports firebase for use
import Firebase
import GoogleSignIn
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?
    let userDefault = UserDefaults()
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // configures firebase onto app
        FirebaseApp.configure()
        // adds in google sign in ability once app is launched and Admin is logged in
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        return true
    }

    // the following methods are used to deal with the Google Sign In on the sign in page, found online at the Google Sign In Authentication manual on firebase
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
      if let error = error {
        print(error.localizedDescription)
        return
      }
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                        accessToken: authentication.accessToken)
       Auth.auth().signIn(with: credential) { (result, error) in
                  if error == nil {
                      self.userDefault.set(true, forKey: "usersignedin")
                      self.userDefault.synchronize()
                      self.window?.rootViewController?.performSegue(withIdentifier: "Segue_to_Signup", sender: nil )
                  } else {
                      print(error?.localizedDescription)
                  }
            }
        }
        

    
    
        @available(iOS 9.0, *)
        func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any])
          -> Bool {
          return GIDSignIn.sharedInstance().handle(url)
        }
    
    // for iOS 8 and older
        func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
        }
}




