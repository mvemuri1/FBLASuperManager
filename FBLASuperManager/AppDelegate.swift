//
//  AppDelegate.swift
//  FBLASuperManager
//
//  Created by Megha Vemuri on 2/3/20.
//  Copyright © 2020 Megha Vemuri. All rights reserved.
//

import UIKit
// imports firebase for use
import Firebase
import GoogleSignIn
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate{



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
      // ...
      if let error = error {
        // ...
        return
      }

        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                        accessToken: authentication.accessToken)
      // ...
        }

        func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
        }
    
    
        @available(iOS 9.0, *)
        func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any])
            -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
        }
    
        func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
        }
    
        func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                    withError error: NSError!) {
            if (error == nil) {
          // Perform any operations on signed in user here.
          // ...
        } else {
          print("\(error.localizedDescription)")
        }
    }


}

