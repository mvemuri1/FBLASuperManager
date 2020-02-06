//
//  Register.swift
//  FBLASuperManager
//
//  Created by Megha Vemuri on 2/6/20.
//  Copyright © 2020 Megha Vemuri. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import Firebase


class Register: UIViewController {
    //basic function to load view
 // let userDefault = UserDefaults()
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var schoolName: UITextField!
    
    @IBOutlet weak var chapterWebsite: UITextField!
    
    @IBOutlet weak var chapterCalendar: UITextField!
    
    @IBOutlet weak var instagramLink: UITextField!
    
    @IBOutlet weak var twitterLink: UITextField!
    
    @IBOutlet weak var facebookLink: UITextField!
    
    @IBOutlet weak var joinForm: UITextField!
    
    @IBOutlet weak var eventsForm: UITextField!
    
    @IBOutlet weak var eventsSheet: UITextField!
    
    @IBOutlet weak var signUp: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // shows Google Sign In button
//        GIDSignIn.sharedInstance()?.presentingViewController = self
//        GIDSignIn.sharedInstance().signIn()
    }
    
    func validateField() -> String? {
    
        // Check that all necessary fields are filled in
        if email.text == "" ||
        email.text == "" ||
        password.text == "" ||
        schoolName.text == "" ||
        chapterWebsite.text == "" ||
        chapterCalendar.text == "" ||
        joinForm.text == "" ||
        eventsForm.text == "" ||
        eventsSheet.text == "" ||
            facebookLink.text == "" ||
            instagramLink.text == "" ||
            twitterLink.text == ""
        {
                return "Please ensure that all required fields are completed."
        }
        
        
        
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        // validate the fields
        let error = validateField()
        
        if error != nil {
            // There is some sort of error.
            errorLabel.text = error!
        } else {
            
            Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (result, err) in
                // Check for errors
                if let err = err {
                //    If there is an error
                    self.errorLabel.text = "Error creating user."
                }
                else {
                    // User has been created
                    let db = Firestore.firestore()
                    
                    // creates user
                    db.collection("chapter").addDocument(data: ["email":self.email, "password":self.password, "chapterCalendar":self.chapterCalendar, "chapterWebsite":self.chapterWebsite, "eventsForm":self.eventsForm, "eventsSheet":self.eventsSheet, "facebookLink":self.facebookLink, "instagramLink":self.instagramLink, "joinForm":self.joinForm, "schoolName":self.schoolName, "twitterLink":self.twitterLink, "uid":result!.user.uid]) { (error) in
                        
                        if error != nil {
                        // shows error
                        self.errorLabel.text = "Error creating user."
                        }
                    
                    }
                    
            }
            
                self.transitionToWelcome()
        }
    }
    }
    
    func transitionToWelcome() {
       let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? Welcome
        
        view.window!.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()    }
}