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
// let userDefault = UserDefaults()
   
    
    //References to the UI
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
    
    
    var questions: [String] = []
    var answers: [String] = []
    var name: [String] = []
    var bio: [String] = []
    var attendanceDates: [String] = []
    var attendanceRef: [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.alpha = 0
        setUpElements()
        
    }
        
    func setUpElements() {
        Utilities.styleFilledButton(signUp)
    }
        override func didReceiveMemoryWarning() {
              super.didReceiveMemoryWarning()    }
    

    
    
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
      
    //shows error to user through error label
    func showError(_ message:String) {
              
              errorLabel.text = message
              errorLabel.alpha = 1
          }
    
  
    
    @IBAction func signUpTapped(_ sender: Any) {
          
          // validate the fields
         let error = validateFields()
        let db = Firestore.firestore()
          
          if error != nil {
              
              // There's something wrong with the fields, show error message
              showError(error!)
          }
          else {
              
              // Create the user
            Auth.auth().createUser(withEmail: email.text!, password: password.text! ) { (result, err) in
                
                
           // Auth.auth().createUser(withEmail: self.email.text!, password: self.password.text!) { authResult, error in
                  
                  // Check for errors
                  if err != nil {
                      
                      // There was an error creating the user
                      self.showError("Error creating user")
                  }
                  else {
                      
                      // User was created successfully, now store the first name and last name
                      
                      
                      // creates user
                    
                    
                    db.collection("chapter").document(Auth.auth().currentUser!.uid).setData([
                        "chapterCalendar":self.chapterCalendar.text,
                        "email":self.email.text,
                        "chapterWebsite":self.chapterWebsite.text,
                        "eventsForm":self.eventsForm.text,
                        "eventsSheet":self.eventsSheet.text,
                        "facebookLink":self.facebookLink.text,
                        "instagramLink":self.instagramLink.text,
                        "joinForm":self.joinForm.text,
                        "schoolName":self.schoolName.text,
                        "twitterLink":self.twitterLink.text,
                        "questions": self.questions,
                        "answers": self.answers,
                        "name": self.name,
                        "bio": self.bio,
                        "attendanceDates": self.attendanceDates,
                        "attendanceRefs": self.attendanceRef,
                        
                    "uid":result!.user.uid]) { (error) in
                        if error != nil {
                        // shows error
                          self.showError("Error saving user data")
                        }
                    }
                      
                }
                let ref = db.collection("UID").document("useruid")
                
                ref.updateData(["uid": FieldValue.arrayUnion([result!.user.uid])])
                
            }}}
    
    
    //Function to check for strong passwords- checks for common patterns (Ensures user has 8 characters, special character, and a number
    static func isPasswordValid(_ password: String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
        }
    
      
    
   
    
   /* func transitionToWelcome() {
       let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? TabbarAdmin
        
        view.window!.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
        
    }*/

