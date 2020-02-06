//
//  RegistrationInfo.swift
//  
//
//  Created by Annie Seth on 2/5/20.
//

import UIKit
import FirebaseAuth
import Firebase

class RegistrationInfo: UIViewController {

    
    @IBOutlet weak var schoolNameTextField: UITextField!
    
    @IBOutlet weak var chapterWebTextField: UITextField!
    
    @IBOutlet weak var chapterCalTextField: UITextField!
    
    @IBOutlet weak var instagramTextField: UITextField!
    
    @IBOutlet weak var twitterTextField: UITextField!
    
    @IBOutlet weak var facebookTextField: UITextField!
    
    @IBOutlet weak var joinFormTextField: UITextField!
    
    @IBOutlet weak var eventsFormTextField: UITextField!
    
    @IBOutlet weak var eventsSheetTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    
    @IBAction func doneTapped(_ sender: Any) {
    
            
            // Create cleaned versions of the data
            let schoolName = schoolNameTextField.text!
        
            let chapterWebsite = chapterWebTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let chapterCalendar = chapterCalTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let instagramLink = instagramTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let twitterLink = twitterTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let facebookLink = facebookTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let joinForm = joinFormTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let eventsForm = eventsFormTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let eventsSheet = eventsSheetTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
        //THIS HERE MUST CHANGE DEPENDING ON SIGN IN METHOD
        Auth.auth().createUser(withEmail: "", password: "") { (result, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
            //        self.showError("Error creating user")
                }
                else {
                    
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    
                    db.collection("chapter").addDocument(data: ["chapterCalendar":chapterCalendar, "chapterWebsite":chapterWebsite, "eventsForm":eventsForm, "eventsSheet": eventsSheet, "facebookLink": facebookLink, "instagramLink": instagramLink, "joinForm": joinForm, "schoolName": schoolName, "twitterLink": twitterLink, "uid": result!.user.uid ]) { (error) in
                        
                        if error != nil {
                            // Show error message
              //              self.showError("Error saving user data")
                        }
                    }
                    
                    // Transition to the home screen
       //             self.transitionToHome()
                }
                
            }
            
            
            
        }
    }
    
  /*  func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    } */
    
  /*  func transitionToHome() {
        
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? AdminHome
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
       
    }*/
    

