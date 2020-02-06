//
//  Register.swift
//  FBLASuperManager
//
//  Created by Megha Vemuri on 2/6/20.
//  Copyright © 2020 Megha Vemuri. All rights reserved.
//
import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase


class Register: UIViewController {
    //basic function to load view
//    let userDefault = UserDefaults()
    
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
        
    }
        
        override func didReceiveMemoryWarning() {
              super.didReceiveMemoryWarning()    }
        // shows Google Sign In button
//        GIDSignIn.sharedInstance()?.presentingViewController = self
//        GIDSignIn.sharedInstance().signIn()
    
    
    
      func validateFields() -> String?{
      
          // Check that all necessary fields are filled in
        if (email?.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            password?.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            schoolName?.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            chapterWebsite?.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            chapterCalendar?.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            joinForm?.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            eventsForm?.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            eventsSheet?.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            facebookLink?.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            instagramLink?.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            twitterLink?.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "")
          {
                  return "Please ensure that all required fields are completed."
          }
          
          
          return nil
      }
      
    

    
    @IBAction func signUpTapped(_ sender: Any) {
          
          // validate the fields
          let error = validateFields()
          
          if error != nil {
              // There is some sort of error.
            errorLabel?.text = error
          } else {
              
            Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (result, err) in
                  // Check for errors;"
                  if err != nil {
                      
                      // There was an error creating the user
                    self.errorLabel?.text = error
                  }
                  else {
                      // User has been created
                      let db = Firestore.firestore()
                      
                    let docData: [String: Any] = [
                    "email":self.email,
                    "password":self.password,
                    "chapterCalendar":self.chapterCalendar,
                    "chapterWebsite":self.chapterWebsite,
                    "eventsForm":self.eventsForm,
                    "eventsSheet":self.eventsSheet,
                    "facebookLink":self.facebookLink,
                    "instagramLink":self.instagramLink,
                    "joinForm":self.joinForm,
                    "schoolName":self.schoolName,
                    "twitterLink":self.twitterLink,
                    "uid":result!.user.uid]
                    
                      // creates user
                      db.collection("chapter").addDocument(data: docData) { (error) in
                          
                          if error != nil {
                          // shows error
                            self.errorLabel?.text = "Error creating user."
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
}
